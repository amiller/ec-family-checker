"""Checks a family of elliptic curves over Q(t) with torsion group T and r independent sections.

Usage: python3 check.py T R submission.json. Exit 0 passes, anything else fails.
"""
import hashlib, json, re, subprocess, sys
from pathlib import Path

TORSION = {"1": "[]", "2": "[2]", "3": "[3]", "4": "[4]", "5": "[5]", "6": "[6]", "7": "[7]",
           "8": "[8]", "9": "[9]", "10": "[10]", "12": "[12]",
           "2x2": "[2,2]", "2x4": "[4,2]", "2x6": "[6,2]", "2x8": "[8,2]"}
# Arithmetic in t only, so gp evaluates nothing but a rational function.
EXPR = re.compile(r"[0-9t+\-*/^() ]{1,2000}")

torsion, rank, path = sys.argv[1], int(sys.argv[2]), sys.argv[3]
data = json.loads(Path(path).read_bytes())
a, sections = data["a"], data["sections"]
exprs = a + [c for s in sections for c in s]
assert len(a) == 5 and len(sections) == rank and all(len(s) == 2 for s in sections)
assert all(isinstance(e, str) and EXPR.fullmatch(e) for e in exprs)
seed = int(hashlib.sha256(Path(path).read_bytes()).hexdigest()[:12], 16)
fibres = [2 + (seed >> (12 * i)) % 997 for i in range(3)]
pts = ",".join(f"[{x},{y}]" for x, y in sections)
script = f"""f(a,P)=P[2]^2+a[1]*P[1]*P[2]+a[3]*P[2]-(P[1]^3+a[2]*P[1]^2+a[4]*P[1]+a[5])
{{
a=[{",".join(a)}]; S=[{pts}];
if(#select(P->f(a,P)!=0,S),print("OFF_CURVE");quit(1));
good=0;
forstep(k=0,200,1,
  t0={fibres[0]}+k*{fibres[1]};
  a0=subst(a,t,t0); if(#select(x->denominator(x)==0,a0),next);
  if(ellinit(a0)==[],next);
  E=ellinit(a0); P0=apply(P->subst(P,t,t0),S);
  if(#select(P->!ellisoncurve(E,P),P0),next);
  if(elltors(E)[2]!={TORSION[torsion]},print("TORSION ",elltors(E)[2]," at t=",t0);quit(1));
  if({rank}>0, M=ellheightmatrix(E,P0); if(vecmin(real(mateigen(M,1)[1]))<1e-8,print("DEPENDENT at t=",t0);quit(1)));
  good++; if(good==3,break));
if(good<3,print("FEW_FIBRES");quit(1));
print("PASS");quit(0);
}}
"""
r = subprocess.run([str(Path(__file__).resolve().parent / "gp"), "-q", "-f", "--default", "parisizemax=1G"],
                   input=script, capture_output=True, text=True, timeout=50)
sys.exit(0 if r.returncode == 0 and r.stdout.strip().endswith("PASS") else 1)

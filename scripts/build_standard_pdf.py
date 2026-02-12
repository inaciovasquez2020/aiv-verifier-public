from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from pathlib import Path

md = Path("standard/AIV_ADMISSIBILITY_STANDARD_v1.md").read_text().splitlines()
out = Path("dist/AIV_Admissibility_Standard_v1.pdf")
out.parent.mkdir(parents=True, exist_ok=True)

c = canvas.Canvas(str(out), pagesize=letter)
w, h = letter
x, y = 72, h - 72
c.setFont("Helvetica", 11)

for line in md:
    if y < 72:
        c.showPage()
        c.setFont("Helvetica", 11)
        y = h - 72
    c.drawString(x, y, line[:120])
    y -= 14

c.save()
print(out)

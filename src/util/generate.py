from bottle import default_app, view, get, post, request, static_file, run
import logging as log
from bottle import run, default_app, TEMPLATE_PATH
import os

SRC_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "../template/umaficha")
view_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "../template/umaficha")
infile = os.path.join(os.path.dirname(os.path.abspath(__file__)), "../template/umaficha/historia.txt")
TEMPLATE_PATH.insert(0, view_path)

log.getLogger().setLevel(log.DEBUG)
NPAGE = [
    dict(
        card="xox", title="xox", theme="xox", foot="xox",
        pic=[dict(source="xox", name="xox").values(), dict(source="xox", name="xox").values()],
        flow=dict(statements="xox", steps=["xox", "xox"])
    ),
    dict(
        card="xox", title="xox", theme="xox", foot="xox",
        pic=[dict(source="xox", name="xox").values(), dict(source="xox", name="xox").values()],
        flow=[dict(statements="xox", steps=["xox", "xox"]).values()]
    )
]

PAGE = [
    dict(
        card="xox", title="xox", theme="xox", foot="xox",
        pic=["fig1.jpg fig2.png".split(), "fig2.png xoxa".split()],
        flow=[[["xox"], ["xox", "xox"]]]
    ),
    dict(
        card="xox", title="xox", theme="xox", foot="xox",
        pic=["fig3.png fig4.png".split(), "fig4.png xoxa".split()],
        flow=[[["xox"], ["xox", "xox"]]]
    )
]
PAGE = [[card[key] for key in "card title theme pic flow foot".split()]for card in PAGE]
print(PAGE[0])


def _parse():
    pages = open(infile, "r").read()
    page = [page for page in pages.split("H-") if "DECLARAÇÃO" not in page]
    numbered = {text.split()[0]: "\n".join(text.split("\n")[1:]) for text in page if "aterial" in text}
    parsed = {key: dict(
        Number=key,
        Tema=text.split("Material:")[0],
        Figuras=[],
        Material=text.split("aterial:")[1].split("Ordem:")[0],
        Note=text.split("NOTA:")[1].split("Ordem:")[0] if "NOTA:" in text else "",
        Ordem=[["Ordem:"],
               [line for line in text.split("Ordem:")[1].split("\n") if line and "?" not in line],
               [line for line in text.split("Ordem:")[1].split("\n") if line and "?" in line]],
        Perguntas=[],
        Declara=""
    ) for key, text in numbered.items()}
    for page in parsed.values():
        if page["Note"]:
            page["Material"] = page["Material"].replace("NOTA:{}".format(page["Note"]), "")

    return parsed


def show_parse():
    for p in _parse().values():
        print(p["Number"])
        print(p["Tema"])
        print(p["Material"])
        print(p["Note"])
        print(p["Ordem"])
        print(p["Perguntas"])
        print(p["Declara"])

show_parse()


@get('/')
@view('ficha')
def generate():
    """Return a peer id to identify the user.

    % card, title, theme, pic, material, note, flow, foot

    :return: page with Brython client.
    """
    log.debug('generate')
    pages = _parse().values()
    outpages = [
        ["Ficha de Prática {}".format(page["Number"]),
         "Ficha de Prática {}".format(page["Number"]),
         page["Tema"],
         page["Figuras"],
         page["Material"],
         page["Note"],
         [page["Ordem"]],
         page["Declara"],
         ] for page in pages]
    print(outpages[0])
    return dict(page=outpages, sm=4, fm=14, sp=2, fp=10)


@get('/imagem/<filename:re:.*\.(gif|jpg|png)>')
def pictures(filename):
    """Return a peer id to identify the user.

    :return: page with Brython client.
    """
    log.debug('code request :/<filename/%s>', SRC_DIR + "/" + filename)
    return static_file(filename, root=SRC_DIR)


def main(direc=""):
    """Run Bottle Server

    :return: None.
    """
    run(host='localhost', port=8080)


application = default_app()

if __name__ == "__main__":
    main()

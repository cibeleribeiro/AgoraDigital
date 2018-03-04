'''
from weasyprint import HTML


def HTML2PDF(data, filename, opened=False):

    HTML("../template/umaficha/ficha.html").write_pdf("../template/umaficha/ficha.pdf")


from xhtml2pdf import pisa             # import python module

# Define your data
sourceHtml = "<html><body><p>To PDF or not to PDF</p></body></html>"
sourceHtml = open("../template/umaficha/ficha.html").read()
outputFilename = "test.pdf"

# Utility function
def convertHtmlToPdf(sourceHtml, outputFilename):
    # open output file for writing (truncated binary)
    resultFile = open(outputFilename, "w+b")

    # convert HTML to PDF
    pisaStatus = pisa.CreatePDF(
            sourceHtml,                # the HTML to convert
            dest=resultFile)           # file handle to recieve result

    # close output file
    resultFile.close()                 # close output file

    # return True on success and False on errors
    return pisaStatus.err

# Main program
if __name__ == "__main__":
    pisa.showLogging()
    convertHtmlToPdf(sourceHtml, outputFilename)


# if __name__ == "__main__":
#
#     HTML2PDF(None, "test.pdf", opened=True)
'''

import sys
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtPrintSupport import QPrinter
from PyQt5.QtWebKit import *
from PyQt5.QtWebKitWidgets import QWebView
from PyQt5.QtWidgets import QApplication

app = QApplication(sys.argv)

web = QWebView()
# web.load(QUrl("http://www.google.com"))
# web.show()
# sourceHtml = open("../template/umaficha/ficha.html").read()
local_url = QUrl.fromLocalFile("../template/umaficha/ficha.html")
web.load(local_url)

printer = QPrinter()
printer.setPageSize(QPrinter.A4)
printer.setOutputFormat(QPrinter.PdfFormat)
printer.setOutputFileName("file.pdf")


def convertIt():
    web.print_(printer)
    print("Pdf generated")
    QApplication.exit()


if __name__ == "__main__":
    convertIt()

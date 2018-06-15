Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] dmaengine: rcar-dmac: don't use DMAC error interrupt
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-Id: <87o9gcsxj3.wl%kuninori.morimoto.gx@renesas.com>
Date: Fri, 15 Jun 2018 00:33:12 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgR2VlcnQKClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjawoKPiA+IEN1cnJlbnQgcmNhci1k
bWFjIGlzIHVzaW5nIERNQUMgZXJyb3IgaW50ZXJydXB0IHdoaWNoIHdpbGwgaGFuZGxlIGFsbAo+
ID4gY2hhbm5lbCdzIGVycm9yLiBCdXQgaW4gdGhpcyBkZXNpZ24sIGVycm9yIGhhbmRsaW5nIGl0
c2VsZiB3aWxsIGJlCj4gPiBpc3N1ZSBpZiB1c2VyIHdhbnQgdG8gdXNlIHZpcnR1YWxpemF0aW9u
LCBtdWx0aSBPUywgZXRjLgo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIGN1cnJlbnQgRE1BQyBlcnJv
ciBpbnRlcnJ1cHQgaGFuZGxpbmcsIGFuZCBoYW5kbGUgaXQKPiA+IG9uIGVhY2ggY2hhbm5lbCBp
bnRlcnJ1cHQgaGFuZGxlci4KPiAKPiBKdXN0IHdvbmRlcmluZywgd2hhdCdzIHRoZSB1c2FnZSBw
YXR0ZXJuIHdoZXJlIHRoaXMgY2F1c2VzIGEgcHJvYmxlbT8KPiBEbyB5b3UgcGxhbiB0byBleHBv
cnQgcGFydCBvZiBhIFNZUy1ETUFDIGluc3RhbmNlIHRvIGEgZ3Vlc3Q/CgoidmlydHVhbGl6YXRp
b24sIG11bHRpIE9TIiBwYXJ0IGlzIG1heWJlIG1pc2xlYWRpbmcuCkl0IHdpbGwgYmUgcHJvYmxl
bSBvbiBub24gdmlydHVhbGl6YXRpb24sIHRvby4KCj4gSG93IHRvIG1haW50YWluIGhvc3QvZ3Vl
c3QgaXNvbGF0aW9uPwoKVGhpcyBpcyBhbm90aGVyIHRvcGljL2lzc3VlLCBJIHRoaW5rCgpCZXN0
IHJlZ2FyZHMKLS0tCkt1bmlub3JpIE1vcmltb3RvCi0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5
IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] dmaengine: rcar-dmac: don't use DMAC error interrupt
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-Id: <87muvwsxfj.wl%kuninori.morimoto.gx@renesas.com>
Date: Fri, 15 Jun 2018 00:35:20 +0000
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGksIGFnYWluCgo+ID4gPiBDdXJyZW50IHJjYXItZG1hYyBpcyB1c2luZyBETUFDIGVycm9yIGlu
dGVycnVwdCB3aGljaCB3aWxsIGhhbmRsZSBhbGwKPiA+ID4gY2hhbm5lbCdzIGVycm9yLiBCdXQg
aW4gdGhpcyBkZXNpZ24sIGVycm9yIGhhbmRsaW5nIGl0c2VsZiB3aWxsIGJlCj4gPiA+IGlzc3Vl
IGlmIHVzZXIgd2FudCB0byB1c2UgdmlydHVhbGl6YXRpb24sIG11bHRpIE9TLCBldGMuCj4gPiA+
IFRoaXMgcGF0Y2ggcmVtb3ZlcyBjdXJyZW50IERNQUMgZXJyb3IgaW50ZXJydXB0IGhhbmRsaW5n
LCBhbmQgaGFuZGxlIGl0Cj4gPiA+IG9uIGVhY2ggY2hhbm5lbCBpbnRlcnJ1cHQgaGFuZGxlci4K
PiA+IAo+ID4gSnVzdCB3b25kZXJpbmcsIHdoYXQncyB0aGUgdXNhZ2UgcGF0dGVybiB3aGVyZSB0
aGlzIGNhdXNlcyBhIHByb2JsZW0/Cj4gPiBEbyB5b3UgcGxhbiB0byBleHBvcnQgcGFydCBvZiBh
IFNZUy1ETUFDIGluc3RhbmNlIHRvIGEgZ3Vlc3Q/Cj4gCj4gInZpcnR1YWxpemF0aW9uLCBtdWx0
aSBPUyIgcGFydCBpcyBtYXliZSBtaXNsZWFkaW5nLgo+IEl0IHdpbGwgYmUgcHJvYmxlbSBvbiBu
b24gdmlydHVhbGl6YXRpb24sIHRvby4KPiAKPiA+IEhvdyB0byBtYWludGFpbiBob3N0L2d1ZXN0
IGlzb2xhdGlvbj8KPiAKPiBUaGlzIGlzIGFub3RoZXIgdG9waWMvaXNzdWUsIEkgdGhpbmsKCkkg
d2lsbCBwb3N0IHYzIHBhdGNoLCBzb29uCgoKQmVzdCByZWdhcmRzCi0tLQpLdW5pbm9yaSBNb3Jp
bW90bwotLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5z
dWJzY3JpYmUgZG1hZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21v
QHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJu
ZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

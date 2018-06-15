Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] dmaengine: rcar-dmac: don't use DMAC error interrupt
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-Id: <87y3fgbk34.wl-kuninori.morimoto.gx@renesas.com>
Date: Fri, 15 Jun 2018 07:15:35 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgR2VlcnQKCj4gPiByY2FyLWRtYWMgaGFzIDIgdHlwZXMgb2YgaW50ZXJydXB0LCAxKSBlcnJv
ciBJUlEgKGZvciBhbGwpLAo+ID4gMikgSVJRIGZvciBlYWNoIGNoYW5uZWxzLgo+ID4gSWYgZXJy
b3IgaGFwcGVucyBvbiBzb21lIGNoYW5uZWxzLCB0aGUgZXJyb3IgSVJRIHdpbGwgYmUgaGFuZGxl
ZAo+ID4gYnkgMSksIGFuZCAiYWxsIiBjaGFubmVscyB3aWxsIGJlIHJlc3RhcnRlZC4KPiA+IEJ1
dCBpbiB0aGlzIGRlc2lnbiwgZXJyb3IgaGFuZGxpbmcgaXRzZWxmIHdpbGwgYmUgcHJvYmxlbSBm
b3IKPiA+IG5vbiBlcnJvciBjaGFubmVsIHVzZXJzLgo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIDEp
IGhhbmRsZXIsIGFuZCBoYW5kbGVzIGVycm9yIElSUSBvbiAyKQo+IAo+IFRoYW5rIHlvdSwgdGhh
dCBleHBsYWlucyB0aGUgcmF0aW9uYWxlIQoKVGhhbmtzCgo+IEJUVywgaG93IGNhbiB5b3UgdHJp
Z2dlciBhbiBlcnJvciwgZm9yIHRlc3Rpbmc/CgpXZSBjcmVhdGVkIGxvY2FsIHBhdGNoIHRvIGJy
ZWFrIGFkZHJlc3MgYWxpZ25tZW50LgoKQmVzdCByZWdhcmRzCi0tLQpLdW5pbm9yaSBNb3JpbW90
bwotLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJz
Y3JpYmUgZG1hZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZn
ZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwu
b3JnL21ham9yZG9tby1pbmZvLmh0bWwK

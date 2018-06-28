Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] dmaengine: rcar-dmac: don't use DMAC error interrupt
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180628042123.GJ22377@vkoul-mobl>
Date: Thu, 28 Jun 2018 09:51:23 +0530
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

T24gMTUtMDYtMTgsIDAwOjUzLCBLdW5pbm9yaSBNb3JpbW90byB3cm90ZToKPiAKPiBGcm9tOiBL
dW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+Cj4gCj4g
cmNhci1kbWFjIGhhcyAyIHR5cGVzIG9mIGludGVycnVwdCwgMSkgZXJyb3IgSVJRIChmb3IgYWxs
KSwKPiAyKSBJUlEgZm9yIGVhY2ggY2hhbm5lbHMuCj4gSWYgZXJyb3IgaGFwcGVucyBvbiBzb21l
IGNoYW5uZWxzLCB0aGUgZXJyb3IgSVJRIHdpbGwgYmUgaGFuZGxlZAo+IGJ5IDEpLCBhbmQgImFs
bCIgY2hhbm5lbHMgd2lsbCBiZSByZXN0YXJ0ZWQuCj4gQnV0IGluIHRoaXMgZGVzaWduLCBlcnJv
ciBoYW5kbGluZyBpdHNlbGYgd2lsbCBiZSBwcm9ibGVtIGZvcgo+IG5vbiBlcnJvciBjaGFubmVs
IHVzZXJzLgo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyAxKSBoYW5kbGVyLCBhbmQgaGFuZGxlcyBlcnJv
ciBJUlEgb24gMikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWdudXMgRGFtbSA8ZGFtbStyZW5lc2Fz
QG9wZW5zb3VyY2Uuc2U+Cj4gW0t1bmlub3JpOiB1cGRhdGVkIHBhdGNoIHRvIGFkanVzdCBETUFD
SENSL0RNQU9SXQo+IFNpZ25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5t
b3JpbW90by5neEByZW5lc2FzLmNvbT4KPiBUZXN0ZWQtYnk6IE5ndXllbiBWaWV0IER1bmcgPG52
LWR1bmdAamluc28uY28uanA+Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpBcHBsaWVkLCB0aGFua3MK

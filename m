Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/18] fotg210-udc: remove a bogus dma_sync_single_for_device call
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190211131243.GA21917@lst.de>
Date: Mon, 11 Feb 2019 14:12:43 +0100
To: Felipe Balbi <balbi@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDU6MTA6MjZQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDM6MTk6NDFQTSArMDIwMCwgRmVs
aXBlIEJhbGJpIHdyb3RlOgo+ID4gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyaXRl
czoKPiA+IAo+ID4gPiBkbWFfbWFwX3NpbmdsZSBhbHJlYWR5IHRyYW5zZmVycyBvd25lcnNoaXAg
dG8gdGhlIGRldmljZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gPiAKPiA+IERvIHlvdSB3YW50IG1lIHRvIHRha2UgdGhlIFVTQiBi
aXRzIG9yIHdpbGwgeW91IHRha2UgdGhlIGVudGlyZSBzZXJpZXM/Cj4gPiBJbiBjYXNlIHlvdSdy
ZSB0YWtpbmcgdGhlIGVudGlyZSBzZXJpZXM6Cj4gCj4gSWYgeW91IHdhbnQgdG8gdGFrZSB0aGUg
VVNCIGZlZWwgZnJlZS4gIEkganVzdCB3YW50IG1vc3Qgb2YgdGhpcyBpbgo+IHRoaXMgbWVyZ2Ug
d2luZG93IGlmIHBvc3NpYmxlLgoKSSBkaWRuJ3Qgc2VlIGluIHRoZSBVU0IgdHJlZSB5ZXQsIHNv
IHBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCB0bwp0YWtlIGl0Lgo=

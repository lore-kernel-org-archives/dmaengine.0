Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/18] fotg210-udc: remove a bogus dma_sync_single_for_device call
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190201161026.GE6532@lst.de>
Date: Fri, 1 Feb 2019 17:10:26 +0100
To: Felipe Balbi <balbi@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDM6MTk6NDFQTSArMDIwMCwgRmVsaXBlIEJhbGJpIHdy
b3RlOgo+IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cml0ZXM6Cj4gCj4gPiBkbWFf
bWFwX3NpbmdsZSBhbHJlYWR5IHRyYW5zZmVycyBvd25lcnNoaXAgdG8gdGhlIGRldmljZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAKPiBE
byB5b3Ugd2FudCBtZSB0byB0YWtlIHRoZSBVU0IgYml0cyBvciB3aWxsIHlvdSB0YWtlIHRoZSBl
bnRpcmUgc2VyaWVzPwo+IEluIGNhc2UgeW91J3JlIHRha2luZyB0aGUgZW50aXJlIHNlcmllczoK
CklmIHlvdSB3YW50IHRvIHRha2UgdGhlIFVTQiBmZWVsIGZyZWUuICBJIGp1c3Qgd2FudCBtb3N0
IG9mIHRoaXMgaW4KdGhpcyBtZXJnZSB3aW5kb3cgaWYgcG9zc2libGUuCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [alsa-devel] don't pass a NULL struct device to DMA API functions
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190201160957.GD6532@lst.de>
Date: Fri, 1 Feb 2019 17:09:57 +0100
To: Takashi Iwai <tiwai@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDI6MTY6MDhQTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IEFjdHVhbGx5IHRoZXJlIGFyZSBhIGJ1bmNoIG9mIElTQSBzb3VuZCBkcml2ZXJzIHRo
YXQgc3RpbGwgY2FsbAo+IGFsbG9jYXRvcnMgd2l0aCBOVUxMIGRldmljZS4KPiAKPiBUaGUgcGF0
Y2ggYmVsb3cgc2hvdWxkIGFkZHJlc3MgaXQsIGFsdGhvdWdoIGl0J3Mgb25seSBjb21waWxlLXRl
c3RlZC4KCk9oLCBJIG1pc3NlZCB0aGVzZSAiaW5kaXJlY3QiIGNhbGxzLiAgVGhpcyBsb29rcyBn
b29kIHRvIG1lOgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo=

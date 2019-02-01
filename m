Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [10/18] smc911x: pass struct device to DMA API functions
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190201161116.GG6532@lst.de>
Date: Fri, 1 Feb 2019 17:11:16 +0100
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDI6MTQ6MzRQTSArMDAwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IEFuZCBlcXVpdmFsZW50bHkgZm9yIHJ4ZG1hIGhlcmUuIEhvd2V2ZXIsIGdpdmVuIHRo
YXQgdGhpcyBhbGwgc2VlbXMgb25seSAKPiByZWxldmFudCB0byBhbnRpcXVlIEFSQ0hfUFhBIHBs
YXRmb3JtcyB3aGljaCBhcmUgcHJlc3VtYWJseSBtYW5hZ2luZyB0byAKPiB3b3JrIGFzLWlzLCBp
dCdzIHByb2JhYmx5IG5vdCB3b3J0aCB0aW5rZXJpbmcgdG9vIG11Y2guIEknZCBqdXN0IHN0aWNr
IGEgCj4gbm90ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB3ZSdyZSBzdGlsbCBvbmx5IG1h
a2luZyB0aGVzZSAKPiBzZWxmLWNvbnNpc3RlbnQgd2l0aCB0aGUgZXhpc3RpbmcgZG1hX21hcF9z
aW5nbGUoKSBjYWxscyByYXRoZXIgdGhhbiAKPiBuZWNlc3NhcmlseSBjb3JyZWN0LgoKU291bmRz
IGdvb2QuCg==

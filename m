Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [alsa-devel] don't pass a NULL struct device to DMA API functions
From: Takashi Iwai <tiwai@suse.de>
Message-Id: <s5hwomj7a9e.wl-tiwai@suse.de>
Date: Fri, 01 Feb 2019 17:18:21 +0100
To: Christoph Hellwig <hch@lst.de>
Cc: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCAwMSBGZWIgMjAxOSAxNzowOTo1NyArMDEwMCwKQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gCj4gT24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDI6MTY6MDhQTSArMDEwMCwgVGFrYXNo
aSBJd2FpIHdyb3RlOgo+ID4gQWN0dWFsbHkgdGhlcmUgYXJlIGEgYnVuY2ggb2YgSVNBIHNvdW5k
IGRyaXZlcnMgdGhhdCBzdGlsbCBjYWxsCj4gPiBhbGxvY2F0b3JzIHdpdGggTlVMTCBkZXZpY2Uu
Cj4gPiAKPiA+IFRoZSBwYXRjaCBiZWxvdyBzaG91bGQgYWRkcmVzcyBpdCwgYWx0aG91Z2ggaXQn
cyBvbmx5IGNvbXBpbGUtdGVzdGVkLgo+IAo+IE9oLCBJIG1pc3NlZCB0aGVzZSAiaW5kaXJlY3Qi
IGNhbGxzLiAgVGhpcyBsb29rcyBnb29kIHRvIG1lOgo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCk9LLCBtZXJnZWQgdGhpcyBvbmUgdG8gZm9yLW5leHQg
YnJhbmNoIG5vdyBhcyB3ZWxsLgoKCnRoYW5rcywKClRha2FzaGkK

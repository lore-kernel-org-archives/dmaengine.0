Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [17/18] ALSA: hal2: pass struct device to DMA API functions
From: Takashi Iwai <tiwai@suse.de>
Message-Id: <s5hy36z7aa0.wl-tiwai@suse.de>
Date: Fri, 01 Feb 2019 17:17:59 +0100
To: Christoph Hellwig <hch@lst.de>
Cc: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCAwMSBGZWIgMjAxOSAxNzowOTowNiArMDEwMCwKQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gCj4gT24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDI6MTI6NDVQTSArMDEwMCwgVGFrYXNo
aSBJd2FpIHdyb3RlOgo+ID4gU2hhbGwgSSB0YWtlIHRoaXMgb25lIHRocm91Z2ggc291bmQgZ2l0
IHRyZWUgb3IgYWxsIHRocm91Z2ggeW91cnM/Cj4gCj4gRmVlbCBmcmVlIHRvIG1lcmdlIHRoZSBz
b3VuZCBiaXRzIHRocm91Z2ggeW91ciB0cmVlIQoKQWxyaWdodCwgbWVyZ2VkIGJvdGggcGF0Y2hl
cyAxNyBhbmQgMTggbm93LgoKCnRoYW5rcywKClRha2FzaGkK

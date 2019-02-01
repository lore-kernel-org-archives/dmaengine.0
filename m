Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [18/18] ALSA: pass struct device to DMA API functions
From: Takashi Iwai <tiwai@suse.de>
Message-Id: <s5hpnsb8xen.wl-tiwai@suse.de>
Date: Fri, 01 Feb 2019 14:13:04 +0100
To: Christoph Hellwig <hch@lst.de>
Cc: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCAwMSBGZWIgMjAxOSAwOTo0ODowMSArMDEwMCwKQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gCj4gVGhlIERNQSBBUEkgZ2VuZXJhbGx5IHJlbGllcyBvbiBhIHN0cnVjdCBkZXZpY2Ug
dG8gd29yayBwcm9wZXJseSwgYW5kCj4gb25seSBiYXJlbHkgd29ya3Mgd2l0aG91dCBvbmUgZm9y
IGxlZ2FjeSByZWFzb25zLiAgUGFzcyB0aGUgZWFzaWx5Cj4gYXZhaWxhYmxlIHN0cnVjdCBkZXZp
Y2UgZnJvbSB0aGUgcGxhdGZvcm1fZGV2aWNlIHRvIHJlbWVkeSB0aGlzLgo+IAo+IEFsc28gdXNl
IEdGUF9LRVJORUwgaW5zdGVhZCBvZiBHRlBfVVNFUiBhcyB0aGUgZ2ZwX3QgZm9yIHRoZSBtZW1v
cnkKPiBhbGxvY2F0aW9uLCBhcyB3ZSBzaG91bGQgdHJlYXQgdGhpcyBhbGxvY2F0aW9uIGFzIGEg
bm9ybWFsIGtlcm5lbCBvbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+CgpSZXZpZXdlZC1ieTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgoK
CnRoYW5rcywKClRha2FzaGkK

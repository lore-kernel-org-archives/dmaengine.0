Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [13/18] fotg210-udc: pass struct device to DMA API functions
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87a7jfodb0.fsf@linux.intel.com>
Date: Fri, 01 Feb 2019 15:20:35 +0200
To: Christoph Hellwig <hch@lst.de>, John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Cc: iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyaXRlczoKCj4gVGhlIERNQSBBUEkgZ2Vu
ZXJhbGx5IHJlbGllcyBvbiBhIHN0cnVjdCBkZXZpY2UgdG8gd29yayBwcm9wZXJseSwgYW5kCj4g
b25seSBiYXJlbHkgd29ya3Mgd2l0aG91dCBvbmUgZm9yIGxlZ2FjeSByZWFzb25zLiAgUGFzcyB0
aGUgZWFzaWx5Cj4gYXZhaWxhYmxlIHN0cnVjdCBkZXZpY2UgZnJvbSB0aGUgcGxhdGZvcm1fZGV2
aWNlIHRvIHJlbWVkeSB0aGlzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+CgpJbiBjYXNlIHlvdSdyZSB0YWtpbmcgdGhlIGVudGlyZSBzZXJpZXM6CgpB
Y2tlZC1ieTogRmVsaXBlIEJhbGJpIDxmZWxpcGUuYmFsYmlAbGludXguaW50ZWwuY29tPgo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Thierry Reding <thierry.reding@gmail.com>
Message-Id: <20180430104124.GE2476@ulmo>
Date: Mon, 30 Apr 2018 12:41:24 +0200
To: Nipun Gupta <nipun.gupta@nxp.com>
Cc: robin.murphy@arm.com, hch@lst.de, linux@armlinux.org.uk, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, bhelgaas@google.com, zajec5@gmail.com, andy.gross@linaro.org, david.brown@linaro.org, dan.j.williams@intel.com, vinod.koul@intel.com, robh+dt@kernel.org, frowand.list@gmail.com, jarkko.sakkinen@linux.intel.com, rafael.j.wysocki@intel.com, dmitry.torokhov@gmail.com, johan@kernel.org, msuchanek@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, bharat.bhushan@nxp.com, leoyang.li@nxp.com
List-ID: <dmaengine.vger.kernel.org>

T24gU2F0LCBBcHIgMjgsIDIwMTggYXQgMDg6MjE6NThBTSArMDUzMCwgTmlwdW4gR3VwdGEgd3Jv
dGU6ClsuLi5dCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYyBiL2RyaXZl
cnMvZ3B1L2hvc3QxeC9idXMuYwo+IGluZGV4IDg4YTM1NTguLmE5ZWM5OWQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1
cy5jCj4gQEAgLTMxNCw2ICszMTQsMTMgQEAgc3RhdGljIGludCBob3N0MXhfZGV2aWNlX21hdGNo
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKPiAgCXJldHVy
biBzdHJjbXAoZGV2X25hbWUoZGV2KSwgZHJ2LT5uYW1lKSA9PSAwOwo+ICB9Cj4gIAo+ICtzdGF0
aWMgaW50IGhvc3QxeF9kbWFfY29uZmlndXJlKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsJ
aWYgKGRldi0+b2Zfbm9kZSkKPiArCQlyZXR1cm4gb2ZfZG1hX2NvbmZpZ3VyZShkZXYsIGRldi0+
b2Zfbm9kZSk7CgpUaGUgY29uZGl0aW9uYWwgaGVyZSBpcyBzb21ld2hhdCBwb2ludGxlc3Mgc2lu
Y2UgdGhlIG9mX25vZGUgc2hvdWxkCmFsd2F5cyBiZSBzZXQuIElmIGl0IHdlcmVuJ3QgaXQgc2hv
dWxkIGJlIGNvbnNpZGVyZWQgYSBidWcgYW5kIHRoaXMKZnVuY3Rpb24gd2VsY29tZSB0byBjcmFz
aCB0byBtYWtlIHRoYXQgdmVyeSBvYnZpb3VzLgoKRWl0aGVyIHdheToKCkFja2VkLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo=

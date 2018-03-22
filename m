Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20180322081705.GB29444@lst.de>
Date: Thu, 22 Mar 2018 09:17:05 +0100
To: Bharat Bhushan <bharat.bhushan@nxp.com>
Cc: Nipun Gupta <nipun.gupta@nxp.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "zajec5@gmail.com" <zajec5@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

PiA+ICtpbnQgZG1hX2NvbmZpZ3VyZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKwlp
ZiAoZGV2LT5idXMtPmRtYV9jb25maWd1cmUpCj4gPiArCQlyZXR1cm4gZGV2LT5idXMtPmRtYV9j
b25maWd1cmUoZGV2KTsKPiAKPiBXaGF0IGlmIGRtYV9jb21tb25fY29uZmlndXJlKCkgaXMgY2Fs
bGVkIGluIGNhc2UgImJ1cy0+ZG1hX2NvbmZpZ3VyZSIgaXMgbm90IGRlZmluZWQ/CgpUaGVuIHdl
J2Qgc3RpbGwgaGF2ZSBhIGRlcGVuZGVuY3kgb2YgY29tbW9uIGNvZGUgb24gT0YgYW5kIEFDUEku
CgpPbiB0aGUgb3RoZXIgaGFuZCB3ZSdkIGdldCBmcmVlIE9GIGFuZCBBQ1BJIGRtYSByYW5nZXMg
cGFyc2luZyBmb3IKZXZlcnlvbmUsIHdoaWNoIG1pZ2h0IGJlIGhhbmR5LiAgQW5kIHdoaWNoIHdv
dWxkIHJlYWxseSBoZWxwIG1pdGlnYXRpbmcKdGhlIHJpc2sgdGhhdCB3ZSBtaXNzZWQgc29tZSBi
dXMgdGhhdCBnZXRzIGRtYSBjb25maWd1cmF0aW9uIGZyb20gT0YsCnNvIG1heWJlIGl0IGFjdHVh
bGx5IGlzIGEgZ29vZCBpZGVhLiAgSSdkIGp1c3QgcmVuYW1lIGl0IHRvCmRtYV9kZWZhdWx0X2Nv
bmZpZ3VyZSBvciBzaW1pbGFyIGluIHRoYXQgY2FzZS4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBi
b2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jk
b21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

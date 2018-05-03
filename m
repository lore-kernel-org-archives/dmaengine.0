Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20180503122133.GA18590@lst.de>
Date: Thu, 3 May 2018 14:21:33 +0200
To: Nipun Gupta <nipun.gupta@nxp.com>
Cc: robin.murphy@arm.com, hch@lst.de, linux@armlinux.org.uk, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, bhelgaas@google.com, zajec5@gmail.com, andy.gross@linaro.org, david.brown@linaro.org, dan.j.williams@intel.com, vinod.koul@intel.com, thierry.reding@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com, jarkko.sakkinen@linux.intel.com, rafael.j.wysocki@intel.com, dmitry.torokhov@gmail.com, johan@kernel.org, msuchanek@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, bharat.bhushan@nxp.com, leoyang.li@nxp.com
List-ID: <dmaengine.vger.kernel.org>

VGhpcyBzdGlsbCBmYWlscyB0byBhcHBseSBhZ2FpbnN0IGVpdGhlciA0LjE3LXJjMyBvciBjdXJy
ZW50IExpbnVzCm1hc3RlciBmb3IgbWUuICBQbGVhc2UgcmVzZW5kIGFnYWluc3QgaXQsIGFuZCBt
ZW50aW9uIHRoZSB0cmVlIGl0CmlzIGFnYWluc3QuCgpBbHNvIHBsZWFzZSByZXNlbmQgaXQgaW4g
YSBzZXBhcmF0ZSBlbWFpbCB0aHJlYWQgKGFsbCB5b3VyIHBhdGNoZXMKd2VyZSByZXBsaWVzIHRv
IHRoZSBwcmV2aW91cyBvbmVzKSBhbmQgaW5jbHVkZSBhIGNvdmVyIGxldHRlci4KLS0tClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFl
bmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwu
b3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jk
b21vLWluZm8uaHRtbAo=

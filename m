Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20180423125657.GC8824@lst.de>
Date: Mon, 23 Apr 2018 14:56:57 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nipun Gupta <nipun.gupta@nxp.com>, robin.murphy@arm.com, hch@lst.de, linux@armlinux.org.uk, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, bhelgaas@google.com, zajec5@gmail.com, andy.gross@linaro.org, david.brown@linaro.org, dan.j.williams@intel.com, vinod.koul@intel.com, thierry.reding@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com, jarkko.sakkinen@linux.intel.com, rafael.j.wysocki@intel.com, dmitry.torokhov@gmail.com, johan@kernel.org, msuchanek@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, bharat.bhushan@nxp.com, leoyang.li@nxp.com
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDI6MjA6NDFQTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBJIGFzc3VtZSB5b3UnbGwgbWVyZ2UgdGhpcyB2aWEgc29tZSBub24tUENJIHRyZWUu
ICBMZXQgbWUga25vdyBpZiB5b3UKPiBuZWVkIGFueXRoaW5nIGVsc2UgZnJvbSBtZS4KCkknbGwg
dGFrZSBpdCB0aHJvdWdoIHRoZSBkbWEtbWFwcGluZyB0cmVlLCBzbyB5b3Ugc2hvdWxkIGJlIGZp
bmUuCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5z
dWJzY3JpYmUgZG1hZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21v
QHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJu
ZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

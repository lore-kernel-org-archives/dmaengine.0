Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Nipun Gupta <nipun.gupta@nxp.com>
Message-Id: <HE1PR0401MB242569E833A5D617A8818ADEE6A90@HE1PR0401MB2425.eurprd04.prod.outlook.com>
Date: Thu, 22 Mar 2018 15:05:10 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "zajec5@gmail.com" <zajec5@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bharat Bhushan <bharat.bhushan@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IENocmlzdG9waCBIZWxsd2lnIFtt
YWlsdG86aGNoQGxzdC5kZV0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjIsIDIwMTggMTM6NDYK
PiBUbzogTmlwdW4gR3VwdGEgPG5pcHVuLmd1cHRhQG54cC5jb20+Cj4gCj4gPiArc3RhdGljIGlu
dCBhbWJhX2RtYV9jb25maWd1cmUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sKPiA+ICsJcmV0
dXJuIGRtYV9jb21tb25fY29uZmlndXJlKGRldik7Cj4gPiArfQo+IAo+IFNvIGl0IHR1cm5zIG91
dCB3ZSBvbmx5IGVuZCB3aXRoIHR3byBjYWxsZXJzIG9mIGRtYV9jb21tb25fY29uZmlndXJlCj4g
YWZ0ZXIgdGhpcyBzZXJpZXMuICBCYXNlZCBvbnQgaGF0IEknbSB0ZW1wdGVkIHdpdGggdGhlIHN1
Z2dlc3Rpb24KPiBmcm9tIFJvYmluIHRvIGp1c3QgaGF2ZSBhbWJhIGNhbGwgcGxhdGZvcm1fZG1h
X2NvbmZpZ3VyZSwgYW5kIG1vdmUKPiB0aGUgY29kZSBmcm9tIGRtYV9jb21tb25fY29uZmlndXJl
IHRvIHBsYXRmb3JtX2RtYV9jb25maWd1cmUuCgpva2F5LCB0aGF0IHdvdWxkIGJlIGZpbmUsIHRy
aXZpYWwgcXVlcnkgLSB3aWxsIGl0IGJlIG9rYXkgdG8gaW5jbHVkZQonbGludXgvcGxhdGZvcm1f
ZGV2aWNlLmgnIGluIHRoZSBBTUJBIGJ1cz8gSSBhbSByZWx1Y3RhbnQgZm9yIHRoaXMgY2hhbmdl
CmJlY2F1c2Ugb2YgaW5jbHVkaW5nIHBsYXRmb3JtIGZpbGUuCgpUaGFua3MsCk5pcHVuCi0tLQpU
byB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUg
ZG1hZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2Vy
bmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21h
am9yZG9tby1pbmZvLmh0bWwK

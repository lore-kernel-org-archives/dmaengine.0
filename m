Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Nipun Gupta <nipun.gupta@nxp.com>
Message-Id: <HE1PR0401MB24259708C02B6AD57C11A18EE68D0@HE1PR0401MB2425.eurprd04.prod.outlook.com>
Date: Fri, 27 Apr 2018 17:10:48 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "zajec5@gmail.com" <zajec5@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bharat Bhushan <bharat.bhushan@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IENocmlzdG9waCBIZWxsd2lnIFtt
YWlsdG86aGNoQGxzdC5kZV0KPiBTZW50OiBNb25kYXksIEFwcmlsIDIzLCAyMDE4IDY6MjcgUE0K
PiBUbzogTmlwdW4gR3VwdGEgPG5pcHVuLmd1cHRhQG54cC5jb20+Cj4gQ2M6IHJvYmluLm11cnBo
eUBhcm0uY29tOyBoY2hAbHN0LmRlOyBsaW51eEBhcm1saW51eC5vcmcudWs7Cj4gZ3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc7IG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbTsKPiBiaGVsZ2Fhc0Bn
b29nbGUuY29tOyB6YWplYzVAZ21haWwuY29tOyBhbmR5Lmdyb3NzQGxpbmFyby5vcmc7Cj4gZGF2
aWQuYnJvd25AbGluYXJvLm9yZzsgZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tOyB2aW5vZC5rb3Vs
QGludGVsLmNvbTsKPiB0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb207IHJvYmgrZHRAa2VybmVsLm9y
ZzsgZnJvd2FuZC5saXN0QGdtYWlsLmNvbTsKPiBqYXJra28uc2Fra2luZW5AbGludXguaW50ZWwu
Y29tOyByYWZhZWwuai53eXNvY2tpQGludGVsLmNvbTsKPiBkbWl0cnkudG9yb2tob3ZAZ21haWwu
Y29tOyBqb2hhbkBrZXJuZWwub3JnOyBtc3VjaGFuZWtAc3VzZS5kZTsgbGludXgtCj4ga2VybmVs
QHZnZXIua2VybmVsLm9yZzsgaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IGxpbnV4
LQo+IHdpcmVsZXNzQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5v
cmc7IGRyaS0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LXRlZ3JhQHZnZXIu
a2VybmVsLm9yZzsKPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcGNpQHZnZXIu
a2VybmVsLm9yZzsgQmhhcmF0IEJodXNoYW4KPiA8YmhhcmF0LmJodXNoYW5AbnhwLmNvbT47IExl
byBMaSA8bGVveWFuZy5saUBueHAuY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8yXSBk
bWEtbWFwcGluZzogbW92ZSBkbWEgY29uZmlndXJhdGlvbiB0byBidXMKPiBpbmZyYXN0cnVjdHVy
ZQo+IAo+IENhbiB5b3UgcmVzZW5kIHlvdXIgY2hhbmdlcyBhZ2FpbnN0IExpbnV4IDQuMTctcmMy
PyAgVGhlcmUgYXJlIGEgbG90Cj4gb2YgY29uZmxpY3RzIGFzLWlzLgoKU3VyZS4uIEkgd2lsbCBz
ZW5kIGl0IHNvb24uLgoKUmVnYXJkcywKTmlwdW4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5
IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

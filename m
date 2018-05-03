Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,2/2] drivers: remove force dma flag from buses
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180503163622.GA6014@localhost>
Date: Thu, 3 May 2018 22:06:22 +0530
To: Nipun Gupta <nipun.gupta@nxp.com>
Cc: robin.murphy@arm.com, hch@lst.de, linux@armlinux.org.uk, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, bhelgaas@google.com, zajec5@gmail.com, andy.gross@linaro.org, david.brown@linaro.org, dan.j.williams@intel.com, thierry.reding@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com, jarkko.sakkinen@linux.intel.com, rafael.j.wysocki@intel.com, dmitry.torokhov@gmail.com, johan@kernel.org, msuchanek@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, bharat.bhushan@nxp.com, leoyang.li@nxp.com
List-ID: <dmaengine.vger.kernel.org>

T24gU2F0LCBBcHIgMjgsIDIwMTggYXQgMDg6MjE6NTlBTSArMDUzMCwgTmlwdW4gR3VwdGEgd3Jv
dGU6Cj4gV2l0aCBlYWNoIGJ1cyBpbXBsZW1lbnRpbmcgaXRzIG93biBETUEgY29uZmlndXJhdGlv
biBjYWxsYmFjaywKPiB0aGVyZSBpcyBubyBuZWVkIGZvciBidXMgdG8gZXhwbGljaXRseSBoYXZl
IGZvcmNlX2RtYSBpbiBpdHMKPiBnbG9iYWwgc3RydWN0dXJlLiBUaGlzIHBhdGNoIG1vZGlmaWVz
IG9mX2RtYV9jb25maWd1cmUgQVBJIHRvCj4gYWNjZXB0IGFuIGlucHV0IHBhcmFtZXRlciB3aGlj
aCBzcGVjaWZpZXMgaWYgaW1wbGljaXQgRE1BCj4gY29uZmlndXJhdGlvbiBpcyByZXF1aXJlZCBl
dmVuIHdoZW4gaXQgaXMgbm90IGRlc2NyaWJlZCBieSB0aGUKPiBmaXJtd2FyZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBOaXB1biBHdXB0YSA8bmlwdW4uZ3VwdGFAbnhwLmNvbT4KPiBBY2tlZC1ieTog
Qmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4gICMgUENJIHBhcnRzCj4gLS0tCj4g
Q2hhbmdlcyBpbiB2MjoKPiAgIC0gVGhpcyBpcyBhIG5ldyBjaGFuZ2Ugc3VnZ2VzdGVkIGJ5IFJv
YmluIGFuZCBDaHJpc3RvcGgKPiAgICAgYW5kIGlzIGFkZGVkIHRvIHRoZSBzZXJpZXMuCj4gCj4g
Q2hhbmdlcyBpbiB2MzoKPiAgIC0gUmViYXNlIGFuZCBjaGFuZ2VzIGNvcnJlc3BvbmRpbmcgdG8g
dGhlIGNoYW5nZXMgaW4gcGF0Y2ggMS8yCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAgIC0gUmViYXNl
ZCBvbiB0b3Agb2YgNC4xNy1yYzIKPiAKPiAgZHJpdmVycy9hbWJhL2J1cy5jICAgICAgICAgICAg
fCAxIC0KPiAgZHJpdmVycy9iYXNlL3BsYXRmb3JtLmMgICAgICAgfCAzICstLQo+ICBkcml2ZXJz
L2JjbWEvbWFpbi5jICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9kbWEvcWNvbS9oaWRtYV9t
Z210LmMgfCAyICstCgpUaGlzIG9uZToKQWNrZWQtYnk6IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5l
bC5vcmc+Cg==

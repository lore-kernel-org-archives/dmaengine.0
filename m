Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [6/6] dmaengine: sh: rcar-dmac: Use device_iommu_mapped()
From: Joerg Roedel <joro@8bytes.org>
Message-Id: <20181211134343.10664-7-joro@8bytes.org>
Date: Tue, 11 Dec 2018 14:43:43 +0100
To: iommu@lists.linux-foundation.org
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Joerg Roedel <joro@8bytes.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogSm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+CgpVc2UgVXNlIGRldmljZV9pb21t
dV9tYXBwZWQoKSB0byBjaGVjayBpZiB0aGUgZGV2aWNlIGlzCmFscmVhZHkgbWFwcGVkIGJ5IGFu
IElPTU1VLgoKQWNrZWQtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+ClNp
Z25lZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgotLS0KIGRyaXZlcnMv
ZG1hL3NoL3JjYXItZG1hYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvc2gvcmNhci1kbWFjLmMg
Yi9kcml2ZXJzL2RtYS9zaC9yY2FyLWRtYWMuYwppbmRleCA3NGZhMmIxYTZhODYuLjJiNGYyNTY5
ODE2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEvc2gvcmNhci1kbWFjLmMKKysrIGIvZHJpdmVy
cy9kbWEvc2gvcmNhci1kbWFjLmMKQEAgLTE4MDksNyArMTgwOSw3IEBAIHN0YXRpYyBpbnQgcmNh
cl9kbWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJICogbGV2ZWwgd2Ug
Y2FuJ3QgZGlzYWJsZSBpdCBzZWxlY3RpdmVseSwgc28gaWdub3JlIGNoYW5uZWwgMCBmb3Igbm93
IGlmCiAJICogdGhlIGRldmljZSBpcyBwYXJ0IG9mIGFuIElPTU1VIGdyb3VwLgogCSAqLwotCWlm
IChwZGV2LT5kZXYuaW9tbXVfZ3JvdXApIHsKKwlpZiAoZGV2aWNlX2lvbW11X21hcHBlZCgmcGRl
di0+ZGV2KSkgewogCQlkbWFjLT5uX2NoYW5uZWxzLS07CiAJCWNoYW5uZWxzX29mZnNldCA9IDE7
CiAJfQo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/6] iommu/of: Use device_iommu_mapped()
From: Joerg Roedel <joro@8bytes.org>
Message-Id: <20181211134343.10664-3-joro@8bytes.org>
Date: Tue, 11 Dec 2018 14:43:39 +0100
To: iommu@lists.linux-foundation.org
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Joerg Roedel <joro@8bytes.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogSm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+CgpVc2UgVXNlIGRldmljZV9pb21t
dV9tYXBwZWQoKSB0byBjaGVjayBpZiB0aGUgZGV2aWNlIGlzCmFscmVhZHkgbWFwcGVkIGJ5IGFu
IElPTU1VLgoKQWNrZWQtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+ClNp
Z25lZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgotLS0KIGRyaXZlcnMv
aW9tbXUvb2ZfaW9tbXUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvb2ZfaW9tbXUuYyBiL2Ry
aXZlcnMvaW9tbXUvb2ZfaW9tbXUuYwppbmRleCBjNWRkNjMwNzI1MjkuLmJmY2YxMzk1MDNmMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9vZl9pb21tdS5jCisrKyBiL2RyaXZlcnMvaW9tbXUv
b2ZfaW9tbXUuYwpAQCAtMjIwLDcgKzIyMCw3IEBAIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKm9m
X2lvbW11X2NvbmZpZ3VyZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJICogSWYgd2UgaGF2ZSByZWFz
b24gdG8gYmVsaWV2ZSB0aGUgSU9NTVUgZHJpdmVyIG1pc3NlZCB0aGUgaW5pdGlhbAogCSAqIGFk
ZF9kZXZpY2UgY2FsbGJhY2sgZm9yIGRldiwgcmVwbGF5IGl0IHRvIGdldCB0aGluZ3MgaW4gb3Jk
ZXIuCiAJICovCi0JaWYgKG9wcyAmJiBvcHMtPmFkZF9kZXZpY2UgJiYgZGV2LT5idXMgJiYgIWRl
di0+aW9tbXVfZ3JvdXApCisJaWYgKG9wcyAmJiBvcHMtPmFkZF9kZXZpY2UgJiYgZGV2LT5idXMg
JiYgIWRldmljZV9pb21tdV9tYXBwZWQoZGV2KSkKIAkJZXJyID0gb3BzLT5hZGRfZGV2aWNlKGRl
dik7CiAKIAkvKiBJZ25vcmUgYWxsIG90aGVyIGVycm9ycyBhcGFydCBmcm9tIEVQUk9CRV9ERUZF
UiAqLwo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [5/6] xhci: Use device_iommu_mapped()
From: Joerg Roedel <joro@8bytes.org>
Message-Id: <20181211134343.10664-6-joro@8bytes.org>
Date: Tue, 11 Dec 2018 14:43:42 +0100
To: iommu@lists.linux-foundation.org
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Joerg Roedel <joro@8bytes.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogSm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+CgpSZXBsYWNlIHRoZSBkZXYtPmlv
bW11X2dyb3VwIGNoZWNrIHdpdGggYSBwcm9wZXIgZnVuY3Rpb24KY2FsbCB0aGF0IGJldHRlciBy
ZXByZW5zZW50cyBpdHMgcHVycG9zZS4KCkNjOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFu
QGludGVsLmNvbT4KQWNrZWQtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+
ClNpZ25lZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgotLS0KIGRyaXZl
cnMvdXNiL2hvc3QveGhjaS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmMgYi9k
cml2ZXJzL3VzYi9ob3N0L3hoY2kuYwppbmRleCBkYWUzYmUxYjljOGYuLjhlYWNkMmVkNDEyYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmMKKysrIGIvZHJpdmVycy91c2IvaG9z
dC94aGNpLmMKQEAgLTI0NCw3ICsyNDQsNyBAQCBzdGF0aWMgdm9pZCB4aGNpX3plcm9fNjRiX3Jl
Z3Moc3RydWN0IHhoY2lfaGNkICp4aGNpKQogCSAqIGFuIGlvbW11LiBEb2luZyBhbnl0aGluZyB3
aGVuIHRoZXJlIGlzIG5vIGlvbW11IGlzIGRlZmluaXRlbHkKIAkgKiB1bnNhZmUuLi4KIAkgKi8K
LQlpZiAoISh4aGNpLT5xdWlya3MgJiBYSENJX1pFUk9fNjRCX1JFR1MpIHx8ICFkZXYtPmlvbW11
X2dyb3VwKQorCWlmICghKHhoY2ktPnF1aXJrcyAmIFhIQ0lfWkVST182NEJfUkVHUykgfHwgIWRl
dmljZV9pb21tdV9tYXBwZWQoZGV2KSkKIAkJcmV0dXJuOwogCiAJeGhjaV9pbmZvKHhoY2ksICJa
ZXJvaW5nIDY0Yml0IGJhc2UgcmVnaXN0ZXJzLCBleHBlY3RpbmcgZmF1bHRcbiIpOwo=

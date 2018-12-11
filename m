Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/6] ACPI/IORT: Use device_iommu_mapped()
From: Joerg Roedel <joro@8bytes.org>
Message-Id: <20181211134343.10664-4-joro@8bytes.org>
Date: Tue, 11 Dec 2018 14:43:40 +0100
To: iommu@lists.linux-foundation.org
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Joerg Roedel <joro@8bytes.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogSm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+CgpSZXBsYWNlIHRoZSBpb21tdS1j
aGVjayB3aXRoIGEgcHJvcGVyIGFuZCByZWFkYWJsZSBmdW5jdGlvbgpjYWxsLgoKQ2M6IExvcmVu
em8gUGllcmFsaXNpIDxsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tPgpBY2tlZC1ieTogUm9iaW4g
TXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9lcmcgUm9lZGVs
IDxqcm9lZGVsQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9hY3BpL2FybTY0L2lvcnQuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYWNwaS9hcm02NC9pb3J0LmMgYi9kcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5j
CmluZGV4IDcwZjRlODBiOTI0Ni4uMDEyNWM4ZWI5ZTgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Fj
cGkvYXJtNjQvaW9ydC5jCisrKyBiL2RyaXZlcnMvYWNwaS9hcm02NC9pb3J0LmMKQEAgLTgwNSw3
ICs4MDUsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpb3J0X2FkZF9kZXZpY2VfcmVwbGF5KGNvbnN0
IHN0cnVjdCBpb21tdV9vcHMgKm9wcywKIHsKIAlpbnQgZXJyID0gMDsKIAotCWlmIChvcHMtPmFk
ZF9kZXZpY2UgJiYgZGV2LT5idXMgJiYgIWRldi0+aW9tbXVfZ3JvdXApCisJaWYgKG9wcy0+YWRk
X2RldmljZSAmJiBkZXYtPmJ1cyAmJiAhZGV2aWNlX2lvbW11X21hcHBlZChkZXYpKQogCQllcnIg
PSBvcHMtPmFkZF9kZXZpY2UoZGV2KTsKIAogCXJldHVybiBlcnI7Cg==

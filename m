Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,1/6] dmaengine: xilinx_dma: Check for channel idle state before submitting dma descriptor
From: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Message-Id: <CY1PR02MB16924718947201C57BDEB8A1DC0E0@CY1PR02MB1692.namprd02.prod.outlook.com>
Date: Mon, 18 Dec 2017 06:53:55 +0000
To: Vinod Koul <vinod.koul@intel.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "lars@metafoo.de" <lars@metafoo.de>, "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>, "kedare06@gmail.com" <kedare06@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGksCgoJVGhhbmtzIGZvciB0aGUgcmV2aWV3Li4uCgo8U25pcD4KPgo+T24gVGh1LCBEZWMgMDcs
IDIwMTcgYXQgMTA6NTE6MDJBTSArMDUzMCwgS2VkYXJlc3dhcmEgcmFvIEFwcGFuYSB3cm90ZToK
Pgo+PiBAQCAtMjAyOSw2ICsyMDA2LDcgQEAgc3RhdGljIGludCB4aWxpbnhfZG1hX3Rlcm1pbmF0
ZV9hbGwoc3RydWN0Cj4+IGRtYV9jaGFuICpkY2hhbikKPj4KPj4gIAkvKiBSZW1vdmUgYW5kIGZy
ZWUgYWxsIG9mIHRoZSBkZXNjcmlwdG9ycyBpbiB0aGUgbGlzdHMgKi8KPj4gIAl4aWxpbnhfZG1h
X2ZyZWVfZGVzY3JpcHRvcnMoY2hhbik7Cj4+ICsJY2hhbi0+aWRsZSA9IHRydWU7Cj4+Cj4+ICAJ
aWYgKGNoYW4tPmN5Y2xpYykgewo+PiAgCQlyZWcgPSBkbWFfY3RybF9yZWFkKGNoYW4sIFhJTElO
WF9ETUFfUkVHX0RNQUNSKTsgQEAgLQo+MjM0NCw2Cj4+ICsyMzIyLDEyIEBAIHN0YXRpYyBpbnQg
eGlsaW54X2RtYV9jaGFuX3Byb2JlKHN0cnVjdCB4aWxpbnhfZG1hX2RldmljZQo+KnhkZXYsCj4+
ICAJY2hhbi0+aGFzX3NnID0geGRldi0+aGFzX3NnOwo+PiAgCWNoYW4tPmRlc2NfcGVuZGluZ2Nv
dW50ID0gMHgwOwo+PiAgCWNoYW4tPmV4dF9hZGRyID0geGRldi0+ZXh0X2FkZHI7Cj4+ICsJLyog
VGhpcyB2YXJpYWJsZSBlbnVzcmVzIHRoYXQgZGVzY3JpcG90cnMgYXJlIG5vdAo+CQkJCSAgICAg
IF5eXl5eXl5eXl4KPgo+dHlwbwoKU2luY2UgdGhpcyBwYXRjaCBnb3QgYXBwbGllZCAKV2lsbCB0
YWtlIGNhcmUgb2YgdGhpcyBuZXh0IHRpbWUgb24gd2FyZHMuLi4gClRoYW5rcyBmb3IgdGhlIHJl
dmlldy4uLiAKClJlZ2FyZHMsCktlZGFyLgoKPgo+LS0KPn5WaW5vZAotLS0KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIg
aW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9y
ZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5m
by5odG1sCg==

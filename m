Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v16,2/4] net: e100: Replace PCI pool old API
From: David Miller <davem@davemloft.net>
Message-Id: <20171218.150649.1306487926708532702.davem@davemloft.net>
Date: Mon, 18 Dec 2017 15:06:49 -0500 (EST)
To: romain.perier@gmail.com
Cc: axboe@kernel.dk, akpm@linux-foundation.org, dan.j.williams@intel.com, vinod.koul@intel.com, jeffrey.t.kirsher@intel.com, aviad.krawczyk@huawei.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, romain.perier@collabora.com
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogUm9tYWluIFBlcmllciA8cm9tYWluLnBlcmllckBnbWFpbC5jb20+CkRhdGU6IEZyaSwg
MTUgRGVjIDIwMTcgMjA6MzE6MjEgKzAxMDAKCj4gRnJvbTogUm9tYWluIFBlcmllciA8cm9tYWlu
LnBlcmllckBjb2xsYWJvcmEuY29tPgo+IAo+IFRoZSBQQ0kgcG9vbCBBUEkgaXMgZGVwcmVjYXRl
ZC4gVGhpcyBjb21taXQgcmVwbGFjZXMgdGhlIFBDSSBwb29sIG9sZAo+IEFQSSBieSB0aGUgYXBw
cm9wcmlhdGUgZnVuY3Rpb24gd2l0aCB0aGUgRE1BIHBvb2wgQVBJLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvbWFpbiBQZXJpZXIgPHJvbWFpbi5wZXJpZXJAY29sbGFib3JhLmNvbT4KPiBBY2tlZC1i
eTogUGV0ZXIgU2VubmEgVHNjaHVkaW4gPHBldGVyLnNlbm5hQGNvbGxhYm9yYS5jb20+Cj4gQWNr
ZWQtYnk6IEplZmYgS2lyc2hlciA8amVmZnJleS50LmtpcnNoZXJAaW50ZWwuY29tPgo+IFRlc3Rl
ZC1ieTogUGV0ZXIgU2VubmEgVHNjaHVkaW4gPHBldGVyLnNlbm5hQGNvbGxhYm9yYS5jb20+CgpB
Y2tlZC1ieTogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgotLS0KVG8gdW5z
dWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVu
Z2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5v
cmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRv
bW8taW5mby5odG1sCg==

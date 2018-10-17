Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [[PATCH] 8/9] DMA-UART-Driver-for-AST2500
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20181017060531.GU2400@vkoul-mobl>
Date: Wed, 17 Oct 2018 11:35:31 +0530
To: "sudheer.v" <open.sudheer@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Michael Moese <mmoese@suse.de>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Sudheer V <sudheer.veliseti@aspeedtech.com>, ShivahShankar Shakarnarayan rao <shivahshankar.shankarnarayanrao@aspeedtech.com>
List-ID: <dmaengine.vger.kernel.org>

T24gMTctMTAtMTgsIDA5OjQxLCBzdWRoZWVyLnYgd3JvdGU6CgpQbGVhc2UgYWRkIHRoZSBjaGFu
Z2UgbG9nIGRlc2NyaWJpbmcgdGhlIGRyaXZlciBhbmQgaXRzIGZlYXR1cmVzCgo+IFNpZ25lZC1v
ZmYtYnk6IHN1ZGhlZXIudiA8b3Blbi5zdWRoZWVyQGdtYWlsLmNvbT4KCgo+IC0tLQo+ICBkcml2
ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2FzcGVlZF91YXJ0X2RtYS5jIHwgMTU5NCArKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE1OTQgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9hc3BlZWRf
dWFydF9kbWEuYwo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUw
X2FzcGVlZF91YXJ0X2RtYS5jIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9hc3BlZWRf
dWFydF9kbWEuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uZTEwMTlh
OAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2Fz
cGVlZF91YXJ0X2RtYS5jCgp3aHkgaXMgdGhpcyBpbiBzZXJpYWwuIEl0IGlzIGRtYWVuZ2luZSBk
cml2ZXIgc28gYmVsb25ncyB0byBkcml2ZXJzL2RtYS8KbGlrZSBvdGhlciBjb250cm9sbGVycy4g
UGxlYXNlIG1vdmUgaXQgb3V0IGFuZCByZXN1Ym1pdC4KCldoaWxlIGRvaW5nIHJlc3VibWlzc2lv
biBwbGVhc2UgdGFrZSBzb21lIHRpbWUgdG8gdW5kZXJzdGFuZCBzdWJzeXN0ZW0KdGFncyB0byB1
c2UuIChoaW50IGdpdCBsb2cgPHN1YnN5c3RlbT4gd2lsbCB0ZWxsIHlvdSkKCkFsc28gc2VyaWVz
IGhhcyBbW1BBVENIXSA4LzldIHdoZXJlYXMgaXQgc2hvdWxkIGJlIFtQQVRDSCA4LzldIHBsZWFz
ZQpsZXQgZ2l0IGdlbmVyYXRlIHRoYXQgZm9yIHlvdSAoaGludCBnaXQgZm9ybWF0LXBhdGNoIHN0
YXJ0Li5lbmQgZG9lcyBhCmdvb2Qgam9iKQoKPiBAQCAtMCwwICsxLDE1OTQgQEAKPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogICBkcml2ZXJzL3R0eS9z
ZXJpYWwvODI1MC84MjUwX2FzcGVlZF91YXJ0X2RtYS5jCj4gKyAqICAgIDEuIDIwMTgvMDcvMDEg
U2hpdmFoIFNoYW5rYXIgY3JlYXRlZAo+ICsgKiAgICAyLiAyMDE4LzA4LzI1IHN1ZGhlZXIudmVs
aXNldGk8b3Blbi5zdWRoZWVyQGdtYWlsLmNvbT4gbW9kaWZpZWQKCndlIGRvbnQgdXNlIHRoaXMg
bG9nIGluIGtlcm5lbC4gSSBkbyBub3Qgc2VlIHMtby1iIGJ5IFNoaXZhaCwgdGhhdApzaG91bGQg
YmUgYWRkZWQuIEkgdGhpbmsgaGUgc2hvdWxkIGJlIGF1dGhvciBhbmQgeW91IG5lZWQgdG8gbGlz
dApjaGFuZ2VzIHlvdSBkaWQuLgo=

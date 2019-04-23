Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC] dmaengine: bcm2835: Avoid GFP_KERNEL in device_prep_slave_sg
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20190423051109.GE28103@vkoul-mobl>
Date: Tue, 23 Apr 2019 10:41:09 +0530
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, Aaro Koskinen <aaro.koskinen@iki.fi>, Lukas Wunner <lukas@wunner.de>, Florian Kauer <florian.kauer@koalo.de>, Martin Sperl <kernel@martin.sperl.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDEtMDQtMTksIDIwOjM4LCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+IFRoZSBjb21taXQgYWYx
OWI3Y2U3NmJhICgibW1jOiBiY20yODM1OiBBdm9pZCBwb3NzaWJsZSByYWNlcyBvbgo+IGRhdGEg
cmVxdWVzdHMiKSBpbnRyb2R1Y2VzIGEgcG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRl
bmN5LAo+IHdoaWNoIGlzIHRyaWdnZXJlZCBieSBzd2FwcGluZyB0byB0aGUgc2Rob3N0IGludGVy
ZmFjZS4KPiAKPiBTbyBpbnN0ZWFkIG9mIHJlaW50cm9kdWNlIHRoZSByYWNlIGNvbmRpdGlvbiBh
Z2Fpbiwgd2UgY291bGQgYWxzbwo+IGF2b2lkIHRoaXMgc2l0dWF0aW9uIGJ5IHVzaW5nIEdGUF9O
T1dBSVQgZm9yIHRoZSBhbGxvY2F0aW9uIG9mIHRoZQo+IERNQSBidWZmZXIgZGVzY3JpcHRvcnMu
CgpBcHBsaWVkLCB0aGFua3MK

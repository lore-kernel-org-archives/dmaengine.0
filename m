Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dmaengine: rcar-dmac: Fix too early/late system suspend/resume callbacks
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180404055420.GE15443@localhost>
Date: Wed, 4 Apr 2018 11:24:21 +0530
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dan Williams <dan.j.williams@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gVGh1LCBNYXIgMjksIDIwMTggYXQgMDY6NTM6MzJQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IElmIHNlcmlhbCBjb25zb2xlIHdha2UtdXAgaXMgZW5hYmxlZCAoImVjaG8g
ZW5hYmxlZCA+Cj4gL3N5cy8uLi4vdHR5U0MwL3Bvd2VyL3dha2V1cCIpLCBhbmQgYW55IHNlcmlh
bCBpbnB1dCBpcyByZWNlaXZlZCB3aGlsZQo+IHRoZSBzeXN0ZW0gaXMgc3VzcGVuZGVkLCBzZXJp
YWwgcG9ydCBpbnB1dCBubyBsb25nZXIgd29ya3MgYWZ0ZXIgc3lzdGVtCj4gcmVzdW1lLgo+IAo+
IE5vdGUgdGhhdDoKPiAgIDEpIFRoZSBzeXN0ZW0gY2FuIHN0aWxsIGJlIHdva2VuIHVwIHVzaW5n
IHRoZSBzZXJpYWwgY29uc29sZSwKPiAgIDIpIFNlcmlhbCBwb3J0IGlucHV0IGtlZXBzIHdvcmtp
bmcgaWYgdGhlIHN5c3RlbSBpcyB3b2tlbiB1cCBpbiBzb21lCj4gICAgICBvdGhlciB3YXkgKGUu
Zy4gV2FrZS1vbi1MQU4gb3IgZ3Bpby1rZXlzKSwgYW5kIG5vIHNlcmlhbCBpbnB1dCB3YXMKPiAg
ICAgIHJlY2VpdmVkIHdoaWxlIHN1c3BlbmRlZC4KPiAKPiBUbyBmaXggdGhpcywgcmVwbGFjZSBT
RVRfTEFURV9TWVNURU1fU0xFRVBfUE1fT1BTKCkgYnkKPiBTRVRfTk9JUlFfU1lTVEVNX1NMRUVQ
X1BNX09QUygpLCBhcyB0aGUgY2FsbGJhY2tzIGluc3RhbGxlZCBieSB0aGUKPiBmb3JtZXIgaGFw
cGVuIHRvbyBlYXJseSByZXNwLiBsYXRlIGluIHRoZSBzdXNwZW5kIHJlc3AuIHJlc3VtZSBwcm9j
ZXNzLgoKQXBwbGllZCwgdGhhbmtzCg==

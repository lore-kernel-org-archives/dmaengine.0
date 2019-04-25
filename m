Return-Path: <SRS0=dFZC=S3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B3CC282DD
	for <dmaengine@archiver.kernel.org>; Thu, 25 Apr 2019 03:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E360218AD
	for <dmaengine@archiver.kernel.org>; Thu, 25 Apr 2019 03:52:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="M8y/PigK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389044AbfDYDw3 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Apr 2019 23:52:29 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:59306
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388848AbfDYDw3 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 24 Apr 2019 23:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnjF23ojk3xuGNM4wuu7Ko6A6vVJUmZEu3PoFoZryQw=;
 b=M8y/PigK2CCtiwYiUpCEPuQu5Sr59cRJWu3sc2ngoChDoGxCbpdaa33w7SYjFHI/LW3f8BaXG3VhH89hO2sYcUjIr8S4A+RNF062WgTVJ4sppzbwzRvyai1fIZWBcoPwA8YAyvjNlYLWTvgj5IPIXTnpJhz/xViKzsTlhnAkaVk=
Received: from OSBPR01MB1733.jpnprd01.prod.outlook.com (52.134.227.22) by
 OSBPR01MB3398.jpnprd01.prod.outlook.com (20.178.96.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 25 Apr 2019 03:52:22 +0000
Received: from OSBPR01MB1733.jpnprd01.prod.outlook.com
 ([fe80::902e:1148:6b6d:8280]) by OSBPR01MB1733.jpnprd01.prod.outlook.com
 ([fe80::902e:1148:6b6d:8280%3]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 03:52:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund@ragnatech.se>
CC:     Simon Horman <horms@verge.net.au>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        HIROYUKI YOKOYAMA <hiroyuki.yokoyama.vx@renesas.com>
Subject: RE: [PATCH] dmaengine: rcar-dmac: Update copyright information
Thread-Topic: [PATCH] dmaengine: rcar-dmac: Update copyright information
Thread-Index: AQHU78smMz+XEEhstEycfA+c5SHoMqY2p2WAgABsgICAFD0tAIAA7a+A
Date:   Thu, 25 Apr 2019 03:52:21 +0000
Message-ID:
 <OSBPR01MB1733615712FC0F8271580D8BD83D0@OSBPR01MB1733.jpnprd01.prod.outlook.com>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
 <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
 <20190411151756.GC30887@bigcity.dyn.berto.se>
 <CAMuHMdXLM0hkUva4AukBpYy+=mRQ_tWT4XCGb=ZGbuT5nYMzjA@mail.gmail.com>
In-Reply-To: <CAMuHMdXLM0hkUva4AukBpYy+=mRQ_tWT4XCGb=ZGbuT5nYMzjA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 337f54b0-71f6-44c0-e789-08d6c9316bf2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3398;
x-ms-traffictypediagnostic: OSBPR01MB3398:
x-microsoft-antispam-prvs: <OSBPR01MB3398590EF59E136D9ABB76A6D83D0@OSBPR01MB3398.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(366004)(376002)(396003)(346002)(189003)(199004)(9686003)(86362001)(55016002)(97736004)(6436002)(229853002)(256004)(81156014)(8676002)(53936002)(81166006)(25786009)(4326008)(107886003)(6246003)(316002)(7736002)(305945005)(26005)(186003)(74316002)(446003)(476003)(11346002)(14454004)(486006)(478600001)(6116002)(2906002)(3846002)(8936002)(33656002)(68736007)(99286004)(110136005)(54906003)(7696005)(76176011)(53546011)(6506007)(5660300002)(102836004)(71190400001)(93886005)(52536014)(71200400001)(66066001)(76116006)(66476007)(66946007)(73956011)(66446008)(64756008)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3398;H:OSBPR01MB1733.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m4hBt2kfvaWJtOeF8xZ5R8I8iF1goVErUesY5YdMCyH5EliHL9OYBCwrVci4zOxJTZbghWauUg7yYLCcO5vEvrajsluWhpI685yEPthOA3+RrtJ8H8PMXAFK8rus+aBbL8eVd0x1u9OZRKLxaua7ZtGCeRpePJptadHrnQdNS5jl962okUdggE4OLYXo44iaOEwmWEnN2Lt3A0CYAW6BUN0x6Z+R3Wu8lqkKXqg/LFaKLaUPzU7g96oY76WM0uESmCAE/Bdn2ZFVJcs8mD5A6Xn3Pw7eTjniO0v77Ou8WD+pUl75UIoFlA3Pw724NpDwF4YMlmabCbep0ktG95CHCWO4as2Q92ikFBR2ivXcElXygZrbieIJmjNczilCX4CQscj0iNfnWIQjSLyCQ6kOgELYhxTexGyJuhUcf+gXTTo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337f54b0-71f6-44c0-e789-08d6c9316bf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 03:52:21.9194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3398
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190425035221.x4dRJslfWAzHyReBEw98PXM6pD5vUILbE4NoXZCpi2Y@z>

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAyNCwgMjAxOSA5OjIyIFBNDQo+IA0KPiBIaSBOaWtsYXMsIFNoaW1vZGEtc2Fu
LA0KPiANCj4gT24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgNToxOCBQTSBOaWtsYXMgU8O2ZGVybHVu
ZA0KPiA8bmlrbGFzLnNvZGVybHVuZEByYWduYXRlY2guc2U+IHdyb3RlOg0KPiA+IE9uIDIwMTkt
MDQtMTEgMTA6NDk6MzcgKzAyMDAsIFNpbW9uIEhvcm1hbiB3cm90ZToNCj4gPiA+IE9uIFdlZCwg
QXByIDEwLCAyMDE5IGF0IDA4OjI2OjU3UE0gKzAyMDAsIE5pa2xhcyBTw7ZkZXJsdW5kIHdyb3Rl
Og0KPiA+ID4gTm90IHN0cmljdGx5IHJlbGF0ZWQsIGJ1dCBpcyBpdCBhcHByb3ByaWF0ZSB0bzoN
Cj4gPiA+DQo+ID4gPiAxLiBNb3ZlIHRoaXMgZHJpdmVyIGFuZCBkcml2ZXJzL2RtYS9zaC91c2It
ZG1hYy5jIHRvIGRyaXZlcnMvZG1hL3JlbmVzYXMvDQo+IA0KPiBUaGF0IG1heSBtYWtlIHNlbnNl
Li4uDQo+IA0KPiA+ID4gMi4gUmVtb3ZlIGRyaXZlcnMvZG1hL3NoL3N1ZG1hYy5jIHdoaWNoIGFw
cGVhcnMgdW51c2VkDQo+ID4NCj4gPiBJIGxldCBzb21lb25lIHdpdGggYSBiZXR0ZXIgZ3Jhc3Ag
b2YgaGlzdG9yeSBhbnN3ZXIgdGhpcyBvbmUuIEZyb20gbXkNCj4gPiBzaWRlIHJlbW92aW5nIGRy
aXZlcnMgd2hpY2ggYXJlIHVudXNlZCBzZWVtcyBsaWtlIGEgZ29vZCBpZGVhIDotKQ0KPiANCj4g
VGhlcmUgc2VlbSB0byBiZSBzb21lIChoYWxmLWJha2VkPykgaW50ZXJhY3Rpb24gYmV0d2VlbiBz
dWRtYWMuYyBhbmQNCj4gZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yOGE2NjU5Ny11ZGMuYyBhbmQg
ZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9maWZvLmMuDQo+IFRoZXNlIGRvbid0IHNlZW0gdG8g
YmUgdXNlZCBhdCBhbGwgb24gUmVuZXNhcyBBUk0gcGxhdGZvcm1zLCBidXQNCj4gQ09ORklHX1VT
Ql9SOEE2NjU5N19IQ0QgaXMgZW5hYmxlZCBpbiBzaG1vYmlsZV9kZWZjb25maWcgYW5kDQo+IG11
bHRpX3Y3X2RlZmNvbmZpZz8NCj4gDQo+IFNoaW1vZGEtc2FuOiBjYW4geW91IHBsZWFzZSBlbmxp
Z2h0ZW4gdXM/DQo+IFRoYW5rcyENCg0KU3VyZS4NCg0KLSBTSDRBIC8gc2g3NzU3IGhhcyBTVURN
QUMuIChhbnkgb3RoZXIgUmVuZXNhcyBBUk0gcGxhdGZvcm1zIGRvbid0IGhhdmUgaXQpLg0KICMg
c2g3NzU3IGlzIG5vdCBwdWJsaWMgcHJvZHVjdCB0aG91Z2guLi4NCi0gQXQgZmlyc3QsIEkgYWRk
ZWQgdGhpcyBTVURNQUMgc3VwcG9ydCBpbnRvIHI4YTY2NTk3LXVkYy4NCi0gQnV0LCBvdXIgZGly
ZWN0aW9uIGlzIGNoYW5nZWQgYnkgc29tZSByZWFzb24uIFNvLCB3ZSB1c2UgcmVuZXNhc191c2Jo
cyBkcml2ZXIgYW55d2F5Lg0KLSBUaGUgcmVuZXNhc191c2JocyBzdXBwb3J0cyBkbWFlbmdpbmUs
IHNvIEkgYWRkZWQgZG1hL3NoL3N1ZG1hYyBkcml2ZXIuDQotIEhvd2V2ZXIsIGZvciBzb21lIHJl
YXNvbnMgKG1heWJlIEknbSBidXN5IGZvciBvdGhlciBwcm9qZWN0cz8pLA0KICBJIGRpZG4ndCBh
ZGQgdXNpbmcgdGhlIHN1ZG1hYyBzdXBwb3J0IGludG8gYXJjaC9zaC9rZXJuZWwvY3B1L3NoNGEv
c2V0dXAtc2g3NzU3LmMuDQotIFNvLCBubyBvbmUgdXNlcyBib3RoIHI4YTY2NTk3LXVkYyBhbmQg
c3VkbWFjIG5vdy4NCg0KRnJvbSAyMDEzIChhZGRlZCB0aGUgc3VkbWFjIGRyaXZlcikgdG8gbm93
LCBzaW5jZSBubyBvbmUgaW50ZWdyYXRlZCB0aGUgc3VkbWFjIGZvciBzaDc3NTcsDQpJIHRoaW5r
IHdlIGNhbiByZW1vdmUgdGhlIGRyaXZlci4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNo
aW1vZGENCg0K

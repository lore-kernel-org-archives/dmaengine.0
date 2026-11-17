Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883384;
	b=M9JWo5wUoiazW89U+Fn4Rsrgc85aPmc1s5c1ZFg6Qmn7V+p1cuCRYzdbs63NE78t3Ie7
	 C3gCKpHIIgFvTkfBACaBI/D1A9rqAfVShWqYNs0q4L75sfDCAZIciEhbByrKDleFikob8
	 N/BD0KYOWVLnCMR+fDdizHeqe5J0tx3XvY8Z/3YFJTfQ3+tQq+UQZa6s7k6W8s11GpUVJ
	 M/oMW0qcvSMIwSz9t/PzqJAFzrB5WwG1mTx6DphrqudMupizqJCL4qcvsjnBsdgrdwft5
	 wGyRSH0JteW/L6U+VPbjoB/dicPav0xefDYsKgMnLhV7SrmqF6KWP9XAV4+FokWbltA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883384;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gFWb5+rDSTW92n+RG91qqVJAFoL63+0iupytjh+Ad5g=;
	b=R2W7t8ekIcIvucfYy2NWQHf8vtH4ti/MbJaTFiCOcwhORP6G+Ow12aK35xUeICNVXOdg
	 9sXkyBnokQwNIz/HlPof6qSJwUSGSzYJCDc88Fw3hLmVPGgWZwwL4+svqs2dZo6ixDJTx
	 NqPOhOfC5zR1hPdytEYt2JN12bor0l2JJBvuTqbcUpBj1B8HVYmnAnMXW23V4oN/jMIDK
	 fm74hIG2mGPg0OOKMyBP9l2SeizRbaI4CpzhwUXjy5hurjOoN6oZYcFwMMs+N5gUt76fv
	 7MWS5mc5k9nJ6pGTXB4gixvM23z+y2bi09Gb8rUU2E0tm3emgr+rlYV3FNNkKwFGl8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=accuratesound.ca;
	spf=pass smtp.mailfrom=accuratesound.ca;
	dkim=pass header.d=NETORG5777562.onmicrosoft.com header.i=@NETORG5777562.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NETORG5777562-onmicrosoft-com header.b=vfIOZPRM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.109
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020109.outbound.protection.outlook.com [52.101.191.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9CE606A32C;
	Tue, 17 Nov 2026 02:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=accuratesound.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accuratesound.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=NETORG5777562.onmicrosoft.com header.i=@NETORG5777562.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NETORG5777562-onmicrosoft-com header.b=vfIOZPRM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbkBOnPHCtkOkYv907M3nRH/ygb3t0D5taxMK+ZG4frxPoFIlJEthhDw4Y3vFpxQuIc76+HDWi0LO6Mn0Iqzqqmax+9KIGoIMN03S9AetLvpVhbljeP5Pl8xbETLyk+WkbuWe1D3x3npuozSjwdxPLEb20AZCIFzwq7VKsHHOzhURH9r2ozySxbj7gLEyBM4+0ttKu24aRs7DBafCyuaDFXb7rsf6Qf/4HV4LHkAj17k2er6p30dm9biXz88PJ+DvHeiEkVs/p0CBmynP/AL/qJ7//brcQ9q5hD5vegECo70jaOlvuezuYAbjJCsuwTu3OiX/MdnPs7fCUQBvU/qAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFWb5+rDSTW92n+RG91qqVJAFoL63+0iupytjh+Ad5g=;
 b=dr9sF2ZXFYqbqQZiowhAxfLQj8xaPqgfMXcEJe/JT8EHxm6K2vBJcecA3AsfPsyEFvB7Q5RBcNuAo2dY+M82IBHPrz/y96oqW/AQoJWME+sMHLwhMIJyBquetre7o8CtJ8rifksqMB+OuxciK826JMXih6l2hhCqt2ovWzJmbuYX/AJgXLxT2EecwgDGf/MXKeGOZgZWSuOqlEMfJbLWhH5OG+0BKh+BA5JsrTB+mX7o1/k2hYbubkjwRuCMPqYyv1eFVt1AI/3aLqM0VLazMxXHHVCAMrJ11TV+I2oMfc9fBQcw8ioU1XCADPWVUQu7K/HuGyVBcyqPpXLeNd/Hpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=accuratesound.ca; dmarc=pass action=none
 header.from=accuratesound.ca; dkim=pass header.d=accuratesound.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5777562.onmicrosoft.com; s=selector1-NETORG5777562-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFWb5+rDSTW92n+RG91qqVJAFoL63+0iupytjh+Ad5g=;
 b=vfIOZPRMDF9M2K8thPAQ6/zMtINJkGQg/w6HOWgM8jRzRsnsk0Xsw58M2rqCBPz7+7HO+4OkvLKhSG80BWlzjWiJF76PBG16tjmQsK9LFns2iIPMsmTwkD2jylnJj6fSXs0xV5UapfR6gQ+BlxZD/iuFbLA6WFf36A2RAs6s5sw=
Received: from YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1c2::21) by YT2PR01MB8455.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:b6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 02:42:57 +0000
Received: from YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bde:6c2d:c5a7:18db]) by YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bde:6c2d:c5a7:18db%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 02:42:57 +0000
From: Mitch Barnett <mitch@accuratesound.ca>
To: James Hilliard <james.hilliard1@gmail.com>, Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
	<Frank.Li@kernel.org>, Sergey Khimich <serghox@gmail.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wang YuWei
	<1973615295@qq.com>
Subject: Re: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Thread-Topic: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Thread-Index: AQHddY/oukdpTCc1mECo/+A2m7/saLcxi++S
Date: Tue, 17 Nov 2026 02:42:57 +0000
Message-ID:
 <YT6PR01MB637077E06DBE5CD43E1EE13E43D87B2@YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM>
References:
 <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To:
 <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=accuratesound.ca;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT6PR01MB637077:EE_|YT2PR01MB8455:EE_
x-ms-office365-filtering-correlation-id: 04191b1c-528e-4a63-b094-08df44547cd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|3023799007|260925021911599003|56012099006|260925022911599003|5023799004|260925021311599003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261022113327099003|38070700021|10067099003|7055299009;
x-microsoft-antispam-message-info:
 Xfzd5l/pTO63o0t4L7p8q8zm3ad0JhJq9FhbZFUecTRk2zGD65fhjvotMeNtkbhhk9ZlXnYBODkJD38PJJsXXBBEZKrJU2Bnem9P5/xV5ZDeFVssMEDmrYlCGz1qosPzTyWKasVEHKmpZqy+enD99vQ1hH0wIyUw959ceBqd4aCyusXdxQqJR9KWpRz9Ko/c2mInk/EMEvHghwi4F04ITv/2szKM/rN6VpGpZpj7jZmuqHz841/nt2N16wEVaNsPiFuOPY34rUGu6JF3fM5V/VATcGedyCMpOHpPpFvex5ZOx65FjcIvsjiL8C4bGxEkKjRHFofDxiloZCAtsnNZjvuq2LCJ7kljWMcy/yh/ZjFhvWsB2I2jrdqf49Oe8Q4dIfEBvmoUNXvhsPWx4SYceCpFS1SWk1z91mbkXYvWcGaQ9iWSv/2xfktNkZWziM/jxP/hcUFcndkQEwdUeOr9vHYo0C3yRfvq+btoo8+kMSQ/aeHFAnHMs2a+5w6fdGRFIimhDC76ZoyZ+XvkhaGSzinpeh7mGnVi+FTn6slA1jPmRWpvyOdn6TA0dkH4Sm6vwJOi5qhntA85QI48iJWjhsC0g8K9CmWXbJOBVkEyGHu6wQIwAGKPDbKwTvdhX/fSOyqaVN+NDNRWRUTOZhhcskMwi+9gF2IsgO9n9uIIBO6jngrtIlOe08nEeubNhaN/ZiOR13AM/FuDQhO2ZSrqzw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(260925021911599003)(56012099006)(260925022911599003)(5023799004)(260925021311599003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261022113327099003)(38070700021)(10067099003)(7055299009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?cKt8e5wux89ixIOqM30JzQzcK0jS94XgRG0v/n1sPYDsSi07Rn2C5BwX?=
 =?Windows-1252?Q?1jeJhLdNgPeeOAO2QL/z+IfHYHij4eX/EBncwcfVjkZ1zXUeWgYPwKKm?=
 =?Windows-1252?Q?Ljx4MhG2MF3CMZEN4klAddmJYtfKC697iwNxQtNTru3f1RuKPR76YWxw?=
 =?Windows-1252?Q?Bexe059IPlEuk0dNw6KF216G8wEaieGAaPjTTU196E8DKAeAoYvWK9qV?=
 =?Windows-1252?Q?RYuSJPjmatBfn403oVZGTaifJAoFtWfKgv+1JC2AB2K6l7ffKPwQf1NV?=
 =?Windows-1252?Q?yI9f3jwb1Uy4prAKKv6tLg4Rxe26SMMEjfU/VhfysaE5Tgt9SjPrTqGa?=
 =?Windows-1252?Q?L1Pw7QnJ+HkjRNpV3+MmqNGTOIDF3BX2PIGbU7F5i9qczChgO/5AqhuS?=
 =?Windows-1252?Q?dz/7UKJJLM0CUZNtx0dtRPhmeLOVtRo+cQPZHB0XIxN6a8B+SC+EW8UJ?=
 =?Windows-1252?Q?nJafve0qe3jC0RS9lKsN0z3hTIO6sDG9uAzYGXi748rge4MxarvokgXl?=
 =?Windows-1252?Q?n6lNUJB1P850t9D0Mc3egX4f9llkzQ4q1vcViwJjCZO5YcEKY1+4xabY?=
 =?Windows-1252?Q?9SPVpzmVTGXrE5ITSHgsuE9C6jtc07r6VsCKw9P54BdsmpBN7Gr8VmID?=
 =?Windows-1252?Q?ql19qXwV9914sX4X3beZCknQyrPEJu8E8DchJ9Iq/7k+HTpyIrDReNzd?=
 =?Windows-1252?Q?OoawBXdCLJFcFajRaCn4y+7o7Ec+dfG5zf8JAqcr5Dv0Vvfny16ueTib?=
 =?Windows-1252?Q?lAuEUJrrv76vkzCUMCrmEebFwmETlaR03ymEEvNE4G3FMNw6mtCxrJMn?=
 =?Windows-1252?Q?9zg3tAg3BIYMrxYOaTBMVdB435QUAkOYakFlEV+94cXMTUsLWy/tugXf?=
 =?Windows-1252?Q?nJdCkGxDHlvHqkkPlUkq89xdOz7kAae45ODnnjds7PNFv053trWCtmFx?=
 =?Windows-1252?Q?7ouIiMAj+w5tJd7NocO9CU/sUScySXsbzrQxofOGL4bJdZdB6Tr5qufH?=
 =?Windows-1252?Q?pLOlzzVFJnONbQNSn3cYLK4l1ciRZQLW2qZK1AIIW8VEgvsd1deqmGOa?=
 =?Windows-1252?Q?T8qPmYks1b20OTkvkFp8jBNHGCRUdqWXdKik0HSFwyM5TLm6ZTU5iy8s?=
 =?Windows-1252?Q?2iFv3m0GjRttcZ1adlRQ+MsxY8tJWRs1EQv+7+vBXyoFVLBuT4aFYPnF?=
 =?Windows-1252?Q?E/FLQ+pYm9n+hMZSXMYIikwmoFiQGAGRPqnN9sl26iHog6fStCrnVMcr?=
 =?Windows-1252?Q?CKY/S1ijCSNB95S1cYteNL7VR1rZuOnatEcQ5cAlGnJXzN1W34lAI0db?=
 =?Windows-1252?Q?+mH3vLK1vgniGh4a1phgjDfVZb8yMpLOSVOkDKUl0cZdZQAWtAC9rWw1?=
 =?Windows-1252?Q?z5MSrsY2Q62jyOADnToOy+NqNTukTJQRwJ3Zvu+Ru1QKemTGcWYCuCLn?=
 =?Windows-1252?Q?l0wMpHMeLQGsnPano4BIjSyRIC/0Qnj+Hnmomf4PE+TaUSd49y+9L0/1?=
 =?Windows-1252?Q?0MOQ9FbdRSqQHCUmWE0CL0JqOUFUgNz/j/NYszSwoeS3KJxwprg+kwUT?=
 =?Windows-1252?Q?EBFgEnm2PjRu/mkOXj6dEOoPJ7TofStVJ9QYnE8Hl0JoyJwWJtK0XVsq?=
 =?Windows-1252?Q?//xz2wbdp1faBlCWVDyMU6gr39GGEWQgiDKscMvPFngJscu6fIkqf3+A?=
 =?Windows-1252?Q?AReJ2ILT7QRfuxTafHVCM89EFdWaGHywZjGB+hKiSULIdSmrWB/tirr3?=
 =?Windows-1252?Q?NYewzfo1IBtPWmCYdmK+cGbXNcdZlafYmUEwLyPgFsfe+LIPqrcOJpC3?=
 =?Windows-1252?Q?q1wKdz1wBmMVH3KTjr9Ta6OVpcQ84ongQQPo4jYIpMQCnVfN?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: accuratesound.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04191b1c-528e-4a63-b094-08df44547cd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 02:42:57.1558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b64d99-3ae6-4f97-ba65-24522cb51004
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d9j/N4LQDrYoYTEX+lkVkH0qMyV5vaOCvwm+9Khh8BNyGLBynuU20L2Q+Zxo7iNNc2mzexRvji5ZKMFzC/NI9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8455

Hi James,=0A=
=0A=
Thank you for incorporating the descriptor-callback lifetime and IRQ/channe=
l-reuse fixes in v6.=0A=
=0A=
We've continued investigating the remaining STOP/ABORT safety question on o=
ur Raspberry Pi 5 (RP1) test system, particularly the lifetime of client-ow=
ned ALSA PCM buffers after unsuccessful DMA termination.=0A=
=0A=
We've completed several additional investigations against Raspberry Pi Linu=
x 6.18.50, pinned at cff533aec2fa601846766b32ff57204e0a61bed7:=0A=
=0A=
1. DMAengine/ALSA STOP contract (V24R33): Eight source-executed host tests =
passed. A simulated dmaengine_terminate_async() failure (-ETIMEDOUT) is not=
 propagated by snd_dmaengine_pcm_trigger(). The snd_dmaengine_pcm_sync_stop=
() path returns success after callback synchronization without independentl=
y verifying hardware quiescence.=0A=
=0A=
2. ALSA buffer lifetime (V24R34/V24R35): Twelve further source-executed hos=
t cases passed. The pinned ALSA core can release managed dynamic buffers de=
spite an hw_free error. Preallocated buffers can be detached and subsequent=
ly reused. This exposes a potential client-memory lifetime problem independ=
ently of the DMA driver's descriptor pool.=0A=
=0A=
3. Live RP1 configuration (V24R36=96V24R39): Read-only inspection confirmed=
 the HiFiBerry Digi sound card bound through snd-rpi-wm8804 and designware-=
i2s. The live I=B2S1 device tree contains TX/RX DMA mappings and no I=B2S i=
nterrupt property. However, its PCM streams do not expose the expected prea=
lloc entries, and we're still reconciling the effective PCM component and a=
llocator.=0A=
=0A=
These are source-level tests and read-only hardware configuration checks. W=
e have not reproduced a client-buffer use-after-free on RP1 hardware.=0A=
=0A=
We've also prepared an isolated combination incorporating Raspberry Pi's pe=
r-channel ABORT implementation (PR #7654). It compiles against our matching=
 kernel source, but we have deliberately not installed or exercised it on t=
he hardware.=0A=
=0A=
Our remaining concern is that retaining DMA descriptors does not establish =
that independently owned PCM pages are safe to release. The Synopsys DW_axi=
_dmac documentation cautions that an ABORT does not necessarily complete ou=
tstanding AXI transactions.=0A=
=0A=
Could you or the other DMAengine maintainers clarify two points?=0A=
=0A=
1. Hardware quiescence: Is there an RP1-specific hardware condition, or sup=
ported controller recovery sequence, that positively guarantees all outstan=
ding DMA transactions have completed after a failed STOP followed by ABORT?=
 In particular, does this account for in-flight AXI/PCIe writes and the sha=
red DMA master?=0A=
=0A=
2. Client-buffer ownership: If no such guarantee exists, what would be the =
preferred upstream approach to preventing ALSA from freeing or reusing DMA-=
addressable PCM memory after an unrecoverable termination failure? Would th=
is require a coordinated DMAengine/ALSA fail-closed mechanism, including th=
e HW_FREE, error-cleanup, close, and device-removal paths?=0A=
=0A=
We're holding off on forced STOP/ABORT testing until we can establish a def=
ensible memory-lifetime contract.=0A=
=0A=
Any guidance on the hardware guarantee or appropriate upstream design would=
 be greatly appreciated.=0A=
=0A=
Thanks again for your work on this.=0A=
=0A=
Kind regards,=0A=
Mitch Barnett=0A=
Accurate Sound=0A=
=0A=
References:=0A=
=0A=
Raspberry Pi per-channel ABORT implementation:=0A=
https://github.com/raspberrypi/linux/pull/7654=0A=
=0A=
Pinned Raspberry Pi kernel source:=0A=
https://github.com/raspberrypi/linux/tree/cff533aec2fa601846766b32ff57204e0=
a61bed7=0A=
=0A=
________________________________________=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Sunday, November 15, 2026 10:00 PM=0A=
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>; Vinod Koul <vkoul@kerne=
l.org>; Frank Li <Frank.Li@kernel.org>; Sergey Khimich <serghox@gmail.com>;=
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Sia Jee Heng <jee.hen=
g.sia@intel.com>=0A=
Cc: Mitch Barnett <mitch@accuratesound.ca>; dmaengine@vger.kernel.org <dmae=
ngine@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.ker=
nel.org>; James Hilliard <james.hilliard1@gmail.com>; stable@vger.kernel.or=
g <stable@vger.kernel.org>; Wang YuWei <1973615295@qq.com>=0A=
Subject: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause a=
cknowledgment=0A=
=A0=0A=
Keep cyclic mode in each descriptor so failed preparation and queued=0A=
work cannot change the completion handling of another transfer.=0A=
=0A=
Use the layout-aware channel enable check during termination and retain=0A=
transfer resources when the channel does not stop. Preserve suspension=0A=
status for the pause and resume paths, including acknowledgments that=0A=
arrive after a polling timeout or during another channel's interrupt.=0A=
=0A=
Keep a pending pause across cyclic segment completion and resume the=0A=
segment only after the client releases the pause. Track the active=0A=
descriptor until completion so queued work cannot reissue it while its=0A=
interrupt is pending.=0A=
=0A=
Retain terminated descriptors until their callbacks have drained, including=
=0A=
cyclic descriptors that error handling has moved to the completed list.=0A=
Serialize interrupt status collection with channel reuse so an old event=0A=
cannot complete a replacement transfer.=0A=
=0A=
This series uses the shared virt-dma descriptor-retirement helper [0].=0A=
=0A=
[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v=
1-v2-1-fb7d258702f8@gmail.com/=0A=
=0A=
Assisted-by: Codex:gpt-6-astra=0A=
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
---=0A=
Changes in v6:=0A=
- Retain descriptors through callback synchronization using the posted=0A=
=A0 virt-dma helper, covering pending, executing and error-completed cyclic=
=0A=
=A0 callbacks raised in Mitch's follow-up.=0A=
- Serialize interrupt status collection with channel reuse and clear old=0A=
=A0 completion and error status after successful termination.=0A=
- Link to v5: https://patch.msgid.link/20261113-submit-dw-axi-dma-stop-paus=
e-v1-v5-0-8523a27b5788@gmail.com=0A=
=0A=
Changes in v5:=0A=
- Use a positive enabled-channel condition in the suspend-status helper,=0A=
=A0 following Andy's review.=0A=
- Initialize the resume result immediately before its first use.=0A=
- Separate the lock-protected channel bitfields from the preceding fields.=
=0A=
- Link to v4: https://patch.msgid.link/20261112-submit-dw-axi-dma-stop-paus=
e-v1-v4-0-3ebc24b243db@gmail.com=0A=
=0A=
Changes in v4:=0A=
- Add a preparatory fix for cyclic mode leaking between transfers,=0A=
=A0 following Sashiko's review. Store the mode in each descriptor so=0A=
=A0 failed preparation, error recovery and queued work cannot change=0A=
=A0 another transfer's completion handling.=0A=
- Link to v3: https://patch.msgid.link/20261110-submit-dw-axi-dma-stop-paus=
e-v1-v3-0-35fdfba8b61d@gmail.com=0A=
=0A=
Changes in v3:=0A=
- Wrap the atomic polling calls by argument group and correct their=0A=
=A0 continuation indentation, following Andy's review.=0A=
- Move the termination return-value check simplification into the=0A=
=A0 channel-enable polling patch.=0A=
- Separate the pause-loop conversion to atomic polling from the=0A=
=A0 pending-request and cyclic-restart changes.=0A=
- Annotate the suspend-wait helper with its channel-lock requirement.=0A=
- Pack the lock-protected flags into existing padding while keeping=0A=
=A0 cyclic separately writable, following Andy's review.=0A=
- Link to v2: https://patch.msgid.link/20261109-submit-dw-axi-dma-stop-paus=
e-v1-v2-0-64adc48df793@gmail.com=0A=
=0A=
Changes in v2:=0A=
- Use readx_poll_timeout_atomic() for the single-argument status helpers=0A=
=A0 and express the termination polling interval and timeout in millisecond=
s,=0A=
=A0 following Andy's review.=0A=
- Track pending suspend requests separately from confirmed suspension so=0A=
=A0 resume can handle acknowledgments received after a pause timeout.=0A=
- Use the atomic polling helper, including its final status check, and=0A=
=A0 report -EAGAIN if resume cannot yet cancel a pending suspend request.=
=0A=
- Defer cyclic restart while paused and track the active descriptor until=
=0A=
=A0 completion, preventing resume or issue_pending from reissuing it.=0A=
- Reset pause state on successful termination and channel allocation;=0A=
=A0 clear stale status when starting a new descriptor.=0A=
- Link to v1: https://patch.msgid.link/20261108-submit-dw-axi-dma-stop-paus=
e-v1-v1-0-c48ec19e9ee4@gmail.com=0A=
=0A=
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>=0A=
To: Vinod Koul <vkoul@kernel.org>=0A=
To: Frank Li <Frank.Li@kernel.org>=0A=
To: Sergey Khimich <serghox@gmail.com>=0A=
To: Sia Jee Heng <jee.heng.sia@intel.com>=0A=
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>=0A=
Cc: dmaengine@vger.kernel.org=0A=
Cc: linux-kernel@vger.kernel.org=0A=
=0A=
---=0A=
James Hilliard (7):=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor=
=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: poll the correct enable bit during =
termination=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: retain descriptors when termination=
 times out=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: use atomic polling for suspend ackn=
owledgment=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: preserve pending pause requests=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: retain descriptors until callbacks =
drain=0A=
=A0=A0=A0=A0=A0 dmaengine: dw-axi-dmac: serialize interrupt status with cha=
nnel reuse=0A=
=0A=
=A0drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 183 +++++++++++++++++--=
------=0A=
=A0drivers/dma/dw-axi-dmac/dw-axi-dmac.h=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 10=
 +-=0A=
=A02 files changed, 130 insertions(+), 63 deletions(-)=0A=
---=0A=
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4=0A=
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.gi=
t fixes=0A=
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169=0A=
prerequisite-patch-id: fc343480330da5ff95e5271997fa71107977c2b8=0A=
=0A=
Best regards,=0A=
--=A0=0A=
James Hilliard <james.hilliard1@gmail.com>=0A=

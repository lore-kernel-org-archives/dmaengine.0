Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF433D6ED
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 18:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786903535; cv=fail; b=BodIDrkef9Xn6CiG5iOJ9wdkEVmKAbkf7UuFwMGx6Mw6WAn6N/K0opIKLJGGQwGudxSMV3yK6sNqH/jqdDr3sPuIGQzHOhC05Ohfr9p9IPkxgBqMGoqhRmm3I2A30KwSVkyh+HUBt4L3CnwWJRVfDjR9OxSKJZRv7e5GmSQyijQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786903535; c=relaxed/simple;
	bh=IOUyJkVhPe0W5EdNEi6ozBbRxCgwiC6+nzLmIq5JTMA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TRq+UsQsatLw0xG7YWPuOWUd2dXFT2OL1Pgdp1T024jbq/IQQJpz3kCNwGrMQP7Mrs5D8hu60L1i/2XmYFoSzv9/1b96VL30IPkHXkDeyMdawvX0cuKB/ZSayp6t7D/V6VeWUMDf73ydWw+Zr9MNXEPSbY3ytvmqF5U0U/1H9II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZCFNO/xs; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZCFNO/xs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbPwEiYsddKXu11ALP9XrwY6Uhu1LaKyfA9qwnC4ck9Eis0aZ1AWwBG6tdIhuG2ODCqi+tYlSNM7/g798gH919PmtDrVGWPrUq77wit8E/JUNj0mMIIOjPx7ivrL2lhOBlo2qqoFU6BpGEoqrDzj4tV+zA6TGG0dtf4w3jtZIPV9DWoeUdeFhPy5A+qFfSL4PA419+WFTByAQ7p8eEeq0nZ5aY4MyFuZmnG76WH1MXe/STczTaODWU0E/8y0pya+coFl7avy6IYjWyYKkUYoeIbpz/Z4m0CtA+6G6t+4+Imx/WU8g7iwixR3JezOZ4YrsEGRA/XXwvMalmtHWrAqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOUyJkVhPe0W5EdNEi6ozBbRxCgwiC6+nzLmIq5JTMA=;
 b=zFzu0Wjf1/UqurvaYXyptDLy/1222VvB8C+jdOTZ0fuMb/NNqdWlJWNZ7EYTIUx0PDW5q5081H6oxXqt+3kMxIYAX+gdvbbUtNIPysWIKELUMjVuPbMR3JEKS1AOy3Qm6mRym5+P0sE3QOEK16uNQMT5VBdhE3k1RD9C+vWZKPUyE+CyX+deEilkfi/CjKCHj3XP15LeB38/FaXbf+TedwsaZuErKSUw6rtm+F0cIcGpN5k1zGsCehpucAdKbHM7nHULj1m5IQ0YjJUPxtbWuzDOA9CQsIlJtzGVxrJmSqcUJQQlUgeDIfyE87h5HIzoHm0aolfTUyOvF7l5BCj+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOUyJkVhPe0W5EdNEi6ozBbRxCgwiC6+nzLmIq5JTMA=;
 b=ZCFNO/xs87f+7Q6pzqhetJA5vHBVrlw1llBd74oz1qlcmhMybmqR1Hq8JdoWuKbQVgQmiipy+Phzom6YA5GAQVYwIlBW5r63iFE7RZbduwVtvZLAwaCS4K99qOiXW+aWa5JOYVA3TYuFmTwScv0YP2xx653m+nYdIKLlTm+MQds=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sun, 16 Aug
 2026 18:05:28 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 18:05:28 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: Re: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Thread-Topic: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Thread-Index: AQHdLZbdwO0W0TsJdkqEWxJL4OZzDbag13WAgAAg/IA=
Date: Sun, 16 Aug 2026 18:05:27 +0000
Message-ID: <ba6d6fc86076b4f2e5244cad3c5c70d782dff74a.camel@amd.com>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
	 <20260816-dmaengine-kref-fix-v3-2-7e76187145df@amd.com>
	 <20260816160722.26C811F000E9@smtp.kernel.org>
In-Reply-To: <20260816160722.26C811F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|PH0PR12MB7932:EE_
x-ms-office365-filtering-correlation-id: 57645dcd-1705-42f4-2f58-08defbc0f408
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 h1352SG/lE05X9WcuTGmVYhGJG0LdxKEb6PO3z6BpZRHO3JIF5ut+7SVg3C7nxE9nrYGAhFTiigKwrS3ler7BHeqPhkBnsWneeX/qUv3COtpbd/QL+a+e+iZVJ0PHphdpYFLdIHPgYgx1I+iWgt5ucIBDv4TOtDDiIPlZdATB/L1RGVojKMj/p7Asp8pqFAg9IEaML3/vJSjHAU90FCgclWatCIYkLAAFhwBWBSpeA5JGhBMl5hCYmncQ1Bm7DUGF6VK/1X10mDyH+slWSPIHIAF6/lY+pCtOOI0AC9xjOORO9NrHVbFREoPXMrN6SLygqFcL4gB5fL16F4Qb+u3r67V3vPPN1+XvIveXYogm1TFnVifZXTQo9hOPnKJys0E1fHQBmCvXxKwAQLWvCiGAlImiNpbL7QxwL2eIjRZToQcEZf7cZk3/Gp6vd5FT8SLAGfSFVt6HkO1MJDi8S9aywu61YxauMOPFopmWA5WJq2liCyfnd5RBaFEZMTDnowlsYS7i2u4p1St+dH6GWaXOcEKxga3zaqUhrn9XkUGe6gbdMeJoe0fYM7GfP5U/kmo1Cvf7YTVynXLVR4PDC8z6CCu9i402CD+/XORwtjN6zmRkcXE8+cdAVJMgDkRPi9toRV6yR/KyH8smaOM43jmaP4nhtrcwp2Mc3mh17dozb0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ny9IVFRzTHNodklFcTU3SmkyYzN4enp0TVJvQkJKakZmUTJaZ3IwUjR0UkR1?=
 =?utf-8?B?cmRacko0RFRZbWVQaS83RVEwc1RrWWl5eVpGWHAxbmQxZHl4NGMyNENWZS9G?=
 =?utf-8?B?SUhCVStDVDhVb0loaU93UEl5VTdFTW4wWTVwbURLY0RzQWVENjg2QkhzL3Z6?=
 =?utf-8?B?TUVxckFtcE02RnZ5ZWhCTHkyWFF2WW1reHlTbTlSbFljUjc4dVBYYVVkeVBk?=
 =?utf-8?B?VEFjM1lBMEF4WkI5bDhnME9teG02WFRiYksxS2UzS3ZPYXMwMWhISjJDc2M2?=
 =?utf-8?B?bW8vVnJZMmpnT2Y5RDNGQWg0QWpGRERKSHRpU09yK29wc1I1OTJNQ1crcW04?=
 =?utf-8?B?Z1ZVNnU4RGpLVmJkNk0zQ2lFejdKWGhqcmw4b0U1VjVqZit0U2JwZXlPaHlK?=
 =?utf-8?B?WkY0bG9WK3lxQVZsN1FtZFYyKzlOenNrK1AzRnBXdmw2WnN6NjZMSmhwNWRk?=
 =?utf-8?B?UHh0dFZTZHhDcG9wallsNnVOYnlXVkZLR1JBSEl1VjljQ0h4aysrUmZ1S05Q?=
 =?utf-8?B?YTNJV0JUMytnZjF0QTFtcGVVeEtIdHQzZDBMeXdVZ2dKMlU3NHErR293MXVm?=
 =?utf-8?B?ZUZYNVNSTlBTTHRCT3d0bGRSUUtjTnhYWlZ5VHZ3emtwYmxCdzQrTytEcEJ5?=
 =?utf-8?B?ZTBYbDl2WHExNkNFdGZ1SjF0R0E0QVE3ZjdKSkpoV0VCQUpDRXRIdk1pWStl?=
 =?utf-8?B?MjBPVW1hbkVPOGpuMU1mdzhhOEtyYnRLYk9Td2g4NEpHS2FKcU5xakU3QW51?=
 =?utf-8?B?cWhZL2ZncThKWm5FaFF1bEZ2NXpRU3ZCdVNHTk9OemN5eUtZU3c4d0tnYytX?=
 =?utf-8?B?ZXM3UExzcGdHQmdFL2hoNk5pWjhUYWVjajhmZnNwdGwzTmhIVlRhckNrRFZu?=
 =?utf-8?B?Ym1vNUJ3amRIY1Q5bW1ZYk52aGhHU28xSFBwMjJtdGJ6enB6L2ZsWDJCWThF?=
 =?utf-8?B?cDc3Q2tYeVlIVnJ6blJyeXYyY0pjZC8wem83MkNCaEROdGM0dWJLVk1ab1pE?=
 =?utf-8?B?MGxlQVBRWGpqZC9lYm45TFpVNE1EK2czYkl0WjNxMG1Qd09oaHpjTmlodlUv?=
 =?utf-8?B?c3FWbjZEcnV2dkdmZDF0TWZMZHY5WG03TVhTaUNrc3EycUxIMDRYUmR6ZjFB?=
 =?utf-8?B?NkgxdVo1N0QxeCt1WDhCSHhsbmVsTWpUQ1I3RndiM3FIYnZCVzJYZE1uajEw?=
 =?utf-8?B?bmk0YVl4V0JzV3NoNmN3bkV1SGlZNzVPanVBVW5wcGV1R3NDL1VscGFsNElM?=
 =?utf-8?B?bGx1bWFFbkxqbGhLS1JYMHBvZUdnbVVraEdKV09iNUQrbWpsQ0lwTWNPNGRm?=
 =?utf-8?B?OEpSTjdheWdHaFNxVkFyUWxlc0U0RzlKYmxTR29KQS8rOWJISmxreDdPZzVx?=
 =?utf-8?B?VTJPdXl6bW5CWm93ZEREOExlWlJad2l0OHFWSlZTU0x3TENSZzF3T2l0a1Np?=
 =?utf-8?B?TjRyUXcxb21KMUhBSVNJMXNHV3BYRmEwekd5ZEpxZXJab2hxRFdEMVJ1KzJZ?=
 =?utf-8?B?bVhDOCtaOVZJTHdsb1B6VWZlekpYWVoxTnpvcXhxNWVEWDJZSHhUMitMU0lw?=
 =?utf-8?B?OStySk1sQXdmVytCZmNad21mWGpkeFlMUWlWV1Mxc0NlcUVIOEFEaHhneXBq?=
 =?utf-8?B?RlVERElXa2NhMFdnZHFZUHgxM1ZBWUc1ZkNnWHNjQmZ4MDNTQWZIUmkzd0Jj?=
 =?utf-8?B?Q2hqaUZ6MUZkT3ozSE02Q2VoVzVHVy9mbjVJRHJVZnBRdkhISGxPdktVVVQz?=
 =?utf-8?B?SEEyMXUyQnZ6N0cvOXhrSHBEdHNmLy9UMVkyL3JLRUdmd0tiOVZmU1FyREdk?=
 =?utf-8?B?RGZqTCtCakVRZ2dPWG0rSEJ4T1BOKzd5VGFwVVFiSnR2RWx4MXNUWWRvWG5k?=
 =?utf-8?B?UmZhc0xoU2pXZ3NUMlJGU0pJU1hGMytDa2J4T1dSbXRHZTh4YVBrZjZhTkJx?=
 =?utf-8?B?QXMvVGo4MUg2eUdVdEZEMzM5NVVWRE5sc3NDQkhwRDBESldGSm10d09Wemxt?=
 =?utf-8?B?UThRMnJNYmNaZ3ZnMlNsTUtYbVhENVFsWHR6YU4wVGJnYytwZEtZYXhsTG9P?=
 =?utf-8?B?ZnY4QlF5L09lZ0o4ZkFJelBEamlDQTZ2NDZ5MEpkU0FNMDZUZmNnMDFjc0N1?=
 =?utf-8?B?Q05UdGtmb0xBZEptSGFuRHdVRWluSTBMeStPVW84aGFQRit0NDVadzN5WXJ2?=
 =?utf-8?B?YmJxVGVGNldWVjBkaTBBWWEzVnp3OHVYU0tDSG1MK0NWVzJJZzhiZkpuMXh4?=
 =?utf-8?B?VE1nRkFlNittMFZGb0lraCs1RUtybytUU0tNcnVjYkZJaTE2VVRnWFMrT1dn?=
 =?utf-8?B?ZHBRQ3RIemw5SUlWY2tLNGJBd0wyYjVSSVkwM1RyeWNLcVp2cyt1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2817284E81F8C4C9AD1EC183FC3BCC2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57645dcd-1705-42f4-2f58-08defbc0f408
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2026 18:05:27.9520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6Q2yxrsol/rOVat0sqLARCmzsIkDJK6Moy+8D0HvVV2XB3E25D6PVCRmdwdJ04HH45gYoXwHaFBhF1I/MJL6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932

T24gU3VuLCAyMDI2LTA4LTE2IGF0IDE2OjA3ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0g
Q2xlYXJpbmcgYGNoYW4tPnNsYXZlYCBiZWZvcmUgc3RvcHBpbmcgdGhlIGhhcmR3YXJlIGludHJv
ZHVjZXMgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gYHN0bTMyX2RtYTNfcG1fc3VzcGVu
ZCgpYC4NCj4gLS0NCj4gDQo+IC0tLSBQYXRjaCBbMl06IFtQQVRDSCB2MyAyLzNdIGRtYWVuZ2lu
ZTogZml4IHVzZS1hZnRlci1mcmVlIGluIGRtYV9jaGFuX3B1dCgpIGFuZCBkbWFfcmVsZWFzZV9j
aGFubmVsKCkgLS0tDQo+IGNvbW1pdCBjMGJjYTYwZGM2OTc3Y2NhNzM1MmJhY2QxMDk1MDgxZDg5
Yzg4MjExDQo+IEF1dGhvcjogU2hpdmFuayBHYXJnIDxzaGl2YW5rZ0BhbWQuY29tPg0KPiANCj4g
ZG1hZW5naW5lOiBmaXggdXNlLWFmdGVyLWZyZWUgaW4gZG1hX2NoYW5fcHV0KCkgYW5kIGRtYV9y
ZWxlYXNlX2NoYW5uZWwoKQ0KPiANCj4gV2hlbiBkbWFfZGV2aWNlX3B1dCgpIGRyb3BzIHRoZSBs
YXN0IHJlZmVyZW5jZSBvbiBjaGFuLT5kZXZpY2UtPnJlZiwNCj4gZG1hX2RldmljZV9yZWxlYXNl
KCkgbWF5IGZyZWUgdGhlIGRtYV9kZXZpY2UuIFRoaXMgY29tbWl0IGNhY2hlcyB0aGUNCj4gbW9k
dWxlIG93bmVyIGFuZCBkZWxheXMgZG1hX2NoYW5fcHV0KCkgdG8gcHJldmVudCByZWFkaW5nIGZy
ZWVkIG1lbW9yeS4NCj4gDQo+IExpbms6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDUxOC1kbWFlbmdpbmUta3JlZi1maXgtdjEtMS00ZDYxMjUwNDhmYjdAYW1kLmNvbQ0KPiAN
Cj4gPiAtLS0gYS9kcml2ZXJzL2RtYS9kbWFlbmdpbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZG1h
L2RtYWVuZ2luZS5jDQo+ID4gQEAgLTkxNiw4ICs5MTksNiBAQCB2b2lkIGRtYV9yZWxlYXNlX2No
YW5uZWwoc3RydWN0IGRtYV9jaGFuICpjaGFuKQ0KPiA+ICAJaWYgKC0tY2hhbi0+ZGV2aWNlLT5w
cml2YXRlY250ID09IDApDQo+ID4gIAkJZG1hX2NhcF9jbGVhcihETUFfUFJJVkFURSwgY2hhbi0+
ZGV2aWNlLT5jYXBfbWFzayk7DQo+ID4gIA0KPiA+IC0JZG1hX2NoYW5fcHV0KGNoYW4pOw0KPiA+
IC0NCj4gPiAgCWlmIChjaGFuLT5zbGF2ZSkgew0KPiA+ICAJCXN5c2ZzX3JlbW92ZV9saW5rKCZj
aGFuLT5kZXYtPmRldmljZS5rb2JqLCBETUFfU0xBVkVfTkFNRSk7DQo+ID4gIAkJc3lzZnNfcmVt
b3ZlX2xpbmsoJmNoYW4tPnNsYXZlLT5rb2JqLCBjaGFuLT5uYW1lKTsNCj4gPiAgCQlrZnJlZShj
aGFuLT5uYW1lKTsNCj4gPiAgCQljaGFuLT5uYW1lID0gTlVMTDsNCj4gPiAgCQljaGFuLT5zbGF2
ZSA9IE5VTEw7DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTDQo+
ID4gIAlrZnJlZShjaGFuLT5kYmdfY2xpZW50X25hbWUpOw0KPiA+ICAJY2hhbi0+ZGJnX2NsaWVu
dF9uYW1lID0gTlVMTDsNCj4gPiAgI2VuZGlmDQo+ID4gKwlkbWFfY2hhbl9wdXQoY2hhbik7DQo+
IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IENvdWxkIG1vdmluZyBkbWFfY2hhbl9wdXQoKSBoZXJl
IGludHJvZHVjZSBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQ0KPiBkdXJpbmcgc3lzdGVtIHN1
c3BlbmQ/DQo+IA0KPiBCeSBtb3ZpbmcgZG1hX2NoYW5fcHV0KCkgYWZ0ZXIgdGhlIGJsb2NrIHRo
YXQgY2xlYXJzIGNoYW4tPnNsYXZlLCB0aGUNCj4gaGFyZHdhcmUgY2hhbm5lbCBtYXkgc3RpbGwg
YmUgYWN0aXZlIHdoaWxlIGNoYW4tPnNsYXZlIGlzIE5VTEwuIElmIGENCj4gc3lzdGVtIHN1c3Bl
bmQgb2NjdXJzIGNvbmN1cnJlbnRseSwgZHJpdmVycyBsaWtlIHN0bTMyLWRtYTMgbWlnaHQgY2hl
Y2sNCj4gdGhlIGhhcmR3YXJlIHN0YXRlIGFuZCBhdHRlbXB0IHRvIHByaW50IHRoZSBzbGF2ZSBk
ZXZpY2UgbmFtZToNCj4gDQo+IGRyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLWRtYTMuYzpzdG0zMl9k
bWEzX3BtX3N1c3BlbmQoKSB7DQo+ICAgICAuLi4NCj4gCWNjciA9IHJlYWRsX3JlbGF4ZWQoZGRh
dGEtPmJhc2UgKyBTVE0zMl9ETUEzX0NDUihjaGFuLT5pZCkpOw0KPiAJaWYgKGNjciAmIENDUl9F
Tikgew0KPiAJCWRldl93YXJuKGRldiwgIlN1c3BlbmQgaXMgcHJldmVudGVkOiAlcyBzdGlsbCBp
biB1c2UgYnkgJXNcbiIsDQo+IAkJCSBkbWFfY2hhbl9uYW1lKGMpLCBkZXZfbmFtZShjLT5zbGF2
ZSkpOw0KPiAgICAgLi4uDQo+IH0NCj4gDQo+IFNpbmNlIGRtYV9jaGFuX3B1dCgpICh3aGljaCBz
dG9wcyB0aGUgaGFyZHdhcmUpIGhhc24ndCBiZWVuIGNhbGxlZCB5ZXQsDQo+IENDUl9FTiB3b3Vs
ZCBzdGlsbCBiZSBhY3RpdmUsIGFuZCBkZXZfbmFtZShjLT5zbGF2ZSkgd291bGQgZGVyZWZlcmVu
Y2UNCj4gdGhlIE5VTEwgcG9pbnRlciB3ZSBqdXN0IHNldC4gDQo+IA0KPiBJcyB0aGVyZSBhIHdh
eSB0byBzdG9wIHRoZSBjaGFubmVsIGJlZm9yZSBjbGVhcmluZyB0aGUgc2xhdmUgcG9pbnRlcg0K
PiB3aXRob3V0IHRyaWdnZXJpbmcgdGhlIG9yaWdpbmFsIHVzZS1hZnRlci1mcmVlPw0KDQpUaGlz
IGlzIGEgdmFsaWQgY29uY2Vybi4NClNvLCBlaXRoZXIgd2UgY2FuIGhhdmUgYSBOVUxMIGNoZWNr
IGluIHN0bTMyIGNvZGUgd2hpbGUgcHJpbnRpbmcgZGV2aWNlDQpuYW1lLCBvciBkcm9wIGRtYV9j
aGFuX3B1dCgpIGNoYW5nZSBmb3Igbm93IHRvIGF2b2lkIHRoaXMgdHJpZ2dlcj8NCg0KVGhhbmtz
LA0KU2hpdmFuaw0KDQoNCg0K

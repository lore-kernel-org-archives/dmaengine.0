Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012064.outbound.protection.outlook.com [40.93.195.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF370830
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 05:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202740; cv=fail; b=O291RGeOYgorC6E44Q0SwxBnJPHyD/iilNhg9Qiu08gAo25zJSK8mhD+W063Z62ibZQ5CYQ94VRXuWPhBrWsaQ/wLnhGpNVO/WNlZDbR59fdNUV0zzAmT3OOZzvFNkSf8UaVJkT4Qn5TMyTAZNiPTw9DMLOaxGoY6Om+mxMxqPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202740; c=relaxed/simple;
	bh=mrefkAMksn0d4WUzYDIKTRe2zcvs74FjMYKC1YaLNcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SdIN+4bg6zG8dwIniTUhXFBcqy2idvnDjnbYz9KNDVgkAcGqYG8ZGqBibgZYGhzWlGiijdWjtlHi43izN6RYplNi7pGu1Ttc/ZzgEQ1/QdJHgTBUyKh81rrHPsJ87kbcxGMtd40Zr6+q6baa1qaRZJfeP+VAdZtSX1w4QwA7Mg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=di1gy7db; arc=fail smtp.client-ip=40.93.195.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="di1gy7db"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiiBJ0+ocSuMUYk1J3op3SQIStYHFShbqmRqqzoJ1ZFWauLO7bv5W84tvkOFMgZBC48CRQEE0U7RbH1ESI0sazm1u2SC38vWOpPdqZd5eZ83laCGLPp9/eE3FaCxBkrBoSNLcHAQUNEOMOrC3NfHD1TKNHPE5D4sg90S+x+oEhNsAWlq4bmqxX4LX2ydJ5g9Dy74xUUv/2kbhmoVyewt32eo6LT6Z/Zd9EEt4ZupofuL9DX4o4Dglt+6RV8Jg7lA40c1smjZ+rHw+MfT28uHfLv1C4jBaIZ5h0F+EcRuxfdgveBLXD3I8eHJ6kqMLOHZSy9FmzJdEGp6jY/ERSXh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrefkAMksn0d4WUzYDIKTRe2zcvs74FjMYKC1YaLNcs=;
 b=HLkQ8gSO5ZxMG+I68/otzNVS9whGX8U6Z/tOI2pxl5dQvEHhXyUiKG6MJw125N6RPPYC90Zy881TqSOgKgjg6dAotFaCz9AO/Eo0GoQ8I+Q3oM5MltIdtLMKX9GKh+7WZIHSHIkPFIya+oE9GeL+3B0ouzNDhQjegeDqZ27QPHPto40tNS/gsfk22glgzJk/cKwsrVUEDIa/H0I5yJgrWPn0QgTqjubWMVKagELTc2mObV4Q/JKX0BWHd++UZdhbGRsr0GeN9JwU2j6kxJnGNSqPJLLrjVSkb6qQF5XUykk/ythcTrTRJuwEICbWbUGJx6L3+tgTFt9d2PdKQeGYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrefkAMksn0d4WUzYDIKTRe2zcvs74FjMYKC1YaLNcs=;
 b=di1gy7dbdrUTzkoj4I+AXmC13RAc/6wTQQ15Q++CVOTGgfpG0BcEigDswR81iydztpTOzLEz9EmMOf8IWRy2q6WNiPv6oJ700c+qxlEjL+9GCLvopUMG4ZUo/zyYgossyFzdB/X3vPfd2NEVyXpS+KiMrnY19ou/glXqo80Ox80=
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 05:12:15 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 05:12:15 +0000
From: "Neeli, Srinivas" <srinivas.neeli@amd.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Subject: RE: [PATCH V6 2/4] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Thread-Topic: [PATCH V6 2/4] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Thread-Index: AQHdLzkGwPRNqpFGRk+Gt41JDSd0xbalpxwAgAC/LMA=
Date: Thu, 20 Aug 2026 05:12:15 +0000
Message-ID:
 <SN7PR12MB8147BB8F3D746CED60BE136A93A42@SN7PR12MB8147.namprd12.prod.outlook.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
 <20260818174151.1608971-3-srinivas.neeli@amd.com>
 <20260819174718.892A91F00A3A@smtp.kernel.org>
In-Reply-To: <20260819174718.892A91F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-20T05:11:32.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8147:EE_|PH7PR12MB7260:EE_
x-ms-office365-filtering-correlation-id: e2c4e399-9448-44b6-2540-08defe799968
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 I1pkplL1Xy534llQgBA2htck2t0hd7joxNsaOeBUM960EThl1txTZbGeTuhgBrEewxD1BoOXaB6zwortDrBrpgJlB3VOrc+N9sIVFmTdUeB0THeBkMAhNtX+ZZE3Ajmb/ZXrMREKgmkUc7Y19ZVwqnN39JmYFPrO71TQWhyPov1u8Ho5bKozbolzmxs/y5JfodWyecD1T6Qn0E91MPs1wceXqpI6q3tOtSLrfYseFVZW9rm1wKOKxIqBFsi8l6wAL0fG3YLuVdiJexS8T0unLzNqWY4rVzFP9JH4/RJtQRAFEXBPFQMOeorbxNx0WIqrP4Xsl+d1JzDCy2mIwaGGH71496xmK0PHDuZsXnD/q0S+IX8KJvtezBdaboeTvREe8lcleLM6W0RuC8jeMHvDLETMDgHLGqxXZ8LT0abm3qr5SHZ5JIk7N8R4pIR9sZvQo5tkEvnOGpbtxexXXtE/MQJbUOm9XejYGsYUMaINY+MSbuJZhgt6uYCH3A0i6DHrc3XipO9rjMOJ5NgsKajm8x/m0jER0/E4wdXWvOhYR1XT46SaovNQfoxhH7fzcpevwmMPbH0k099ABpp6vSuaidKuNtBcH4MLZHfh31bRKzlCMZJNgV0yR/HeWnhmnP2AM1lvss2ZA54gcNxQYC2xfcMhGge4IuzjhGC0OBjJLcA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3FadnhGb0F0MUNDdG8rYmYyNXViQWdscWkwTGVMSHVTb3lYMDBWT1FaNVNR?=
 =?utf-8?B?UkNsakI1dEZGbE5taG9zLzZIVjRHaE9TSEtNd1BiWE0vN0kxMGVJMkpnSU9r?=
 =?utf-8?B?SHpBY2dHeHFGS1hlSGpIa05ncWhKTDFUaGw4dFc3WUwvMHN0aC80TFE0dHR4?=
 =?utf-8?B?RTNwK1VsUU4waWYyNFAyc0dKNnJTUVB0aVZwM1g1SkJjWENjc3NwRHZRNngz?=
 =?utf-8?B?cjJDbjQvYlJXYSt1NDV0QjFFMkl4MGdSSmh0dW85M1ByWlRTNjhvZDUyY0o5?=
 =?utf-8?B?anhMd2l1bUdhSng2Ujg1QnNyQ2g2YzJ4KzRyNXFWbkpURWsxQXh6TExnNUY4?=
 =?utf-8?B?QkdsbloyTlNlMmlVQ0RZYWtRdmVlM0hpaHFTaC9vSTlFbFhLQjNwQ245b2Q0?=
 =?utf-8?B?VmxMVlUwVXFRci9rY1E5dFNrZ1I4MndBL1o1UlQ0NldIa1ZFT0N6T0kxcWhh?=
 =?utf-8?B?VmQ1UEdOQW55MUpOYzZscy9FRWlZKzRIV0pDQVpDNjJkYytOV0s5UndzSlpy?=
 =?utf-8?B?Uml3TDN4VncxZlJ0MEpxTlZTNzRUQUpzS3MyT2FLYnZsT09jdDBKbGpGL0xi?=
 =?utf-8?B?SXRKMmZydFJPY0lQRWJCZmw3dS8zRC9xbDlhbnpQU2FlUGZmaWYzLzZONHRV?=
 =?utf-8?B?RG5ocVhzQ01MRmJPVU5CeUZJT0hkaUtNS2g2Q2ZsMDF1OEFIQ29OaVBzS3Zx?=
 =?utf-8?B?cmxObXRRWlJCSkc0SzhzVmIwVWxFWFRBanFBOHVhZ0tUcEdZZE16dDkzMk1M?=
 =?utf-8?B?aFVoNWZNcitURk5KM2tDY0N2RmdLaGg5MU9vNmVrNm1jaTRjekNrYzFkWEox?=
 =?utf-8?B?Tnk1Q0pvN1JrcGNXNER4ZnBldnd2UXNGbWZEQ0RGNjMzY3JvWnhsRWlKVnVx?=
 =?utf-8?B?eDNRMlNZOUg4TEVPQldwbXBUNEFpU0tBUXI2aHJUTlFFbUhsRkRFRk9BeEs3?=
 =?utf-8?B?bW1MWGtJLzc3ek9rVkZMUVlWYVZJak55YUl2cTdOdHdLV1lDbnFkY2pORE14?=
 =?utf-8?B?KzlWY3d3WlBUWEFZb1JIT1pMRFIwUXhQekVHdWRjRDdwM3RjQkc2Y09QNUJM?=
 =?utf-8?B?d3hpdUNNeSsrMDBxYk0zWDAydkUzNzd5RW9mSDYxYzI2YUlaQjFSL0tzM09z?=
 =?utf-8?B?SDU3MWdzL3dJbFJIMURYK1Y3T0RXa0JCcXcxYnlhYXpPK21XRjlaVHZxeUxD?=
 =?utf-8?B?YUVUaXJ4dmZVU0pXb2lyYWR0YmFPZE9TWFNQSHFBU2IzN2RJbXZMZXZBRlVv?=
 =?utf-8?B?bnoxTjcvWllQRjQzd2JDUTlEOEN3ZjAzWHg3R1V4bjdmQVJJMkp5aGppWGNW?=
 =?utf-8?B?ZFRKdUVsWko4RjRsNCsyaDlCUjQreGphTFF0aHhKblhxeWx1RS9mRi9uVWdl?=
 =?utf-8?B?cktNT1lJcHp2ZmZoN3ozZmV0Ym9BNlZxcFBFOWZMYmtoY050VGR3ZjN4ZExK?=
 =?utf-8?B?T3hmd21oSXNSdUtmUlQzQllJUU1IRnFVbnhLNmRtYng2REtjOStYaUpXT3pM?=
 =?utf-8?B?YURQR1NwLzVjTjhjaW9XU2JvODlFenNPNGpDdndNMGxMSG40NjZBTUR1dXV0?=
 =?utf-8?B?R0VlbEQ0RThWUDNHUWl0Ly91c0s5Wm12UWk5aVQ5emREMjlPenNOcFhiRnhs?=
 =?utf-8?B?aGRwLzhqQXpZR2tMREhEckhiWU83NVhKWnNOWFFSeTA1R3RsSFpvdDhvaWxJ?=
 =?utf-8?B?ODJXNXlPWVN5U1FQWS9EWkJhemxEb1Z6ejdYU0NIaVpSUEx4RGRKcy8xeHdG?=
 =?utf-8?B?U0xPcHhVb2JuZEUzOEpRU201aktBeittdTcya1Jvc3hzRlNZaEFXQmFaYmVH?=
 =?utf-8?B?OXZlUTVwdzU0Q0VYUm92TERDS3dFai9Pdmc4VDNIYlp3b2RkWE9HU3ZDd0R6?=
 =?utf-8?B?R0RaZ1NoOE5mN3kzbHVUeTFiWC91dnB0bDN0NEVqcFF5NzczVkJYNU12Zms0?=
 =?utf-8?B?OWVHRHJGL2w4dzlldk5FNTc3Z095dG5TR3VpTUJMNWZsQWNUV1ZpNlV4NnR2?=
 =?utf-8?B?VkR3ZDJXWW1sakphdm1WT0ZrZTAwYW1GVEJ6UHh3d3U4dmtlTlpNTzNnMUtu?=
 =?utf-8?B?UFh4VkdabjJHZ1pGTWo2U2wreWdWS2hla2FpMDRSRFh0TVF5OE1jUThjdkF5?=
 =?utf-8?B?TXg1bWdmcS85eHhPcjF5YTZXM1dNbFRFeEZKSmJkdyt3VlhVTHpKUkZwem1x?=
 =?utf-8?B?ZklUSVNPbGdCTHFaY3h6dHF2bDFaeFRPM1h4YWplZ3R0MVNkUGxmQlBEaFJo?=
 =?utf-8?B?SXE5M1VFenBXb2dNeTd0R3FDbG5aTWhQai9DSFlFZmM3dEcvWG5VaHdiTFhS?=
 =?utf-8?Q?cAJOGZliooqr7Wy5UU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c4e399-9448-44b6-2540-08defe799968
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 05:12:15.1280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Axa7FZY8T4m69PmsCyslOpeNP2MD7YMH6Tjm/j2H+B/o1KSPYewbqxeC/1ScHdt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260

QU1EIEdlbmVyYWwNCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogc2FzaGlrby1ib3RAa2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBBdWd1c3QgMTksIDIwMjYgMTE6MTcgUE0NCj4gVG86IE5lZWxpLCBTcmlu
aXZhcyA8c3Jpbml2YXMubmVlbGlAYW1kLmNvbT4NCj4gQ2M6IEZyYW5rLkxpQGtlcm5lbC5vcmc7
IHZrb3VsQGtlcm5lbC5vcmc7IGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNiAyLzRdIGRtYWVuZ2luZTogeGlsaW54X2RtYTogTW92ZSBkZXNjcmlwdG9y
cyB0byBkb25lDQo+IGxpc3QgYmFzZWQgb24gY29tcGxldGlvbiBiaXQNCj4NCj4gVGhhbmsgeW91
IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRp
YWwgaXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIFVuY29uZGl0aW9uYWwgdHJh
bnNpdGlvbiB0byBgY2hhbi0+aWRsZSA9IHRydWVgIHdoaWxlIGBhY3RpdmVfbGlzdGAgaXMgbm90
DQo+IGVtcHR5IGNhdXNlcyBhIHBlcm1hbmVudCBETUEgc3RhbGwgYW5kIHVuc2FmZSB3cml0ZXMg
dG8gYWN0aXZlIGhhcmR3YXJlDQo+IHJlZ2lzdGVycy4NCj4gLSBbSGlnaF0gTWlzc2luZyBgZG1h
X3JtYigpYCBhZnRlciByZWFkaW5nIHRoZSBoYXJkd2FyZSBkZXNjcmlwdG9yDQo+IGNvbXBsZXRp
b24gYml0IGFsbG93cyBzcGVjdWxhdGl2ZSByZWFkcyBvZiBzdGFsZSBkZXNjcmlwdG9yIGZpZWxk
cy4NCj4gLS0NCj4NCj4gLS0tIFBhdGNoIFsyXTogW1BBVENIIFY2IDIvNF0gZG1hZW5naW5lOiB4
aWxpbnhfZG1hOiBNb3ZlIGRlc2NyaXB0b3JzIHRvDQo+IGRvbmUgbGlzdCBiYXNlZCBvbiBjb21w
bGV0aW9uIGJpdCAtLS0gY29tbWl0DQo+IGYzYWZkMWQ5OTgxNmEyMzBlMzMwZmU0OTE0MTkxM2M1
MzdmZDhiYzkNCj4gQXV0aG9yOiBTcmluaXZhcyBOZWVsaSA8c3Jpbml2YXMubmVlbGlAYW1kLmNv
bT4NCj4NCj4gZG1hZW5naW5lOiB4aWxpbnhfZG1hOiBNb3ZlIGRlc2NyaXB0b3JzIHRvIGRvbmUg
bGlzdCBiYXNlZCBvbiBjb21wbGV0aW9uIGJpdA0KPg0KPiBUaGlzIGNvbW1pdCB1cGRhdGVzIHRo
ZSBkZXNjcmlwdG9yIGNvbXBsZXRpb24gbG9naWMgdG8gY2hlY2sgdGhlIGNvbXBsZXRpb24NCj4g
Yml0IGJlZm9yZSBtb3ZpbmcgTUNETUEgZGVzY3JpcHRvcnMgZnJvbSB0aGUgYWN0aXZlIGxpc3Qg
dG8gdGhlIGRvbmUgbGlzdC4NCj4gVGhpcyBhZGRyZXNzZXMgYW4gaXNzdWUgd2hlcmUgaW50ZXJy
dXB0IGNvYWxlc2NpbmcgY291bGQgY2F1c2UgdW5jb21wbGV0ZWQNCj4gZGVzY3JpcHRvcnMgdG8g
YmUgZXJyb25lb3VzbHkgcmVwb3J0ZWQgYXMgY29tcGxldGUuDQo+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZG1hL3hpbGlueC94aWxpbnhfZG1hLmMNCj4gPiBiL2RyaXZlcnMvZG1hL3hpbGlu
eC94aWxpbnhfZG1hLmMgaW5kZXggOTY1ZmI2OWEyYTNhZC4uOWI4YjZmMWFjZDRlYQ0KPiA+IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZG1hL3hpbGlueC94aWxpbnhfZG1hLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2RtYS94aWxpbngveGlsaW54X2RtYS5jDQo+ID4gQEAgLTE3NzMsNiArMTc3Mywx
NyBAQCBzdGF0aWMgdm9pZA0KPiB4aWxpbnhfZG1hX2NvbXBsZXRlX2Rlc2NyaXB0b3Ioc3RydWN0
IHhpbGlueF9kbWFfY2hhbiAqY2hhbikNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgeGlsaW54X2F4aWRtYV90eF9zZWdtZW50LA0KPiBub2RlKTsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgIGlmICghKHNlZy0+aHcuc3RhdHVzICYNCj4gWElMSU5Y
X0RNQV9CRF9DT01QX01BU0spICYmIGNoYW4tPmhhc19zZykNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgfSBlbHNlIGlmIChjaGFuLT54ZGV2
LT5kbWFfY29uZmlnLT5kbWF0eXBlID09DQo+IFhETUFfVFlQRV9BWElNQ0RNQSkgew0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHhpbGlueF9heGltY2RtYV90eF9zZWdtZW50ICpzZWc7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICB1MzIgc3RhdHVzOw0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgICAgIHNlZyA9IGxpc3RfbGFzdF9lbnRyeSgmZGVzYy0+c2VnbWVudHMsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0DQo+IHhpbGlu
eF9heGltY2RtYV90eF9zZWdtZW50LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG5vZGUpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gKGNo
YW4tPmRpcmVjdGlvbiA9PSBETUFfREVWX1RPX01FTSkgPw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzZWctPmh3LnMybW1fc3RhdHVzIDogc2VnLQ0KPiA+aHcubW0yc19zdGF0dXM7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICBpZiAoIShzdGF0dXMgJiBYSUxJTlhfRE1BX0JEX0NP
TVBfTUFTSykpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPg0KPiBb
U2V2ZXJpdHk6IEhpZ2hdDQo+IElmIHRoaXMgYnJlYWtzIGVhcmx5IGFuZCBsZWF2ZXMgdW5jb21w
bGV0ZWQgZGVzY3JpcHRvcnMgaW4gdGhlIGFjdGl2ZSBsaXN0LCBkb2VzIGl0DQo+IGNhdXNlIGlz
c3VlcyB3aXRoIHRoZSBpbnRlcnJ1cHQgaGFuZGxlcj8NCj4NCj4gTG9va2luZyBhdCB4aWxpbnhf
bWNkbWFfaXJxX2hhbmRsZXIoKSwgaXQgdW5jb25kaXRpb25hbGx5IGNhbGxzDQo+IHN0YXJ0X3Ry
YW5zZmVyKCk6DQo+DQo+ICAgICAgIHhpbGlueF9kbWFfY29tcGxldGVfZGVzY3JpcHRvcihjaGFu
KTsNCj4gICAgICAgY2hhbi0+aWRsZSA9IHRydWU7DQo+ICAgICAgIGNoYW4tPnN0YXJ0X3RyYW5z
ZmVyKGNoYW4pOw0KPg0KPiBJZiB4aWxpbnhfbWNkbWFfc3RhcnRfdHJhbnNmZXIoKSBpcyBjYWxs
ZWQgd2hpbGUgdGhlIERNQSBpcyBzdGlsbCBhY3RpdmVseQ0KPiBwcm9jZXNzaW5nIHRoZSBvbGQg
Y2hhaW4sIGl0IHdpbGwgd3JpdGUgdGhlIG5ldyBkZXNjcmlwdG9yIGNoYWluIHRvIHRoZSBDREVT
Qw0KPiByZWdpc3RlcjoNCj4NCj4gICAgICAgLyogUHJvZ3JhbSBjdXJyZW50IGRlc2NyaXB0b3Ig
Ki8NCj4gICAgICAgeGlsaW54X3dyaXRlKGNoYW4sIFhJTElOWF9NQ0RNQV9DSEFOX0NERVNDX09G
RlNFVChjaGFuLQ0KPiA+dGRlc3QpLA0KPiAgICAgICAgICAgICAgICAgICAgaGVhZF9kZXNjLT5h
c3luY190eC5waHlzKTsNCj4NCj4gQ291bGQgd3JpdGluZyB0byB0aGUgQ0RFU0MgcmVnaXN0ZXIg
d2hpbGUgdGhlIGNoYW5uZWwgaXMgc3RpbGwgcnVubmluZyBjYXVzZSBhDQo+IHBlcm1hbmVudCBE
TUEgc3RhbGwgb3IgY29ycnVwdCB0aGUgaGFyZHdhcmUgc3RhdGU/DQo+DQo+IFtTZXZlcml0eTog
SGlnaF0NCj4gSXMgYSByZWFkIG1lbW9yeSBiYXJyaWVyIG5lZWRlZCBhZnRlciByZWFkaW5nIHRo
ZSBoYXJkd2FyZSBkZXNjcmlwdG9yDQo+IGNvbXBsZXRpb24gYml0Pw0KPg0KPiBJZiB0aGUgY29t
cGxldGlvbiBtYXNrIGlzIHNldCwgdGhlIGNvZGUgbWF5IHByb2NlZWQgdG8gY2FsY3VsYXRlIHRo
ZSB0cmFuc2Zlcg0KPiByZXNpZHVlIGluIHhpbGlueF9kbWFfZ2V0X3Jlc2lkdWUoKToNCj4NCj4g
ICAgICAgcmVzaWR1ZSAtPSBheGltY2RtYV9ody0+czJtbV9zdGF0dXMgJiBjaGFuLT54ZGV2LQ0K
PiA+bWF4X2J1ZmZlcl9sZW47DQo+DQo+IFdpdGhvdXQgYSBkbWFfcm1iKCkgYmV0d2VlbiBjaGVj
a2luZyB0aGUgY29tcGxldGlvbiBiaXQgYW5kIHJlYWRpbmcgdGhlDQo+IHByZWNlZGluZyBzZWdt
ZW50cycgc3RhdHVzIGZpZWxkcywgaXMgaXQgcG9zc2libGUgZm9yIHdlYWtseSBvcmRlcmVkDQo+
IGFyY2hpdGVjdHVyZXMgdG8gc3BlY3VsYXRpdmVseSByZWFkIHN0YWxlIHZhbHVlcywgbGVhZGlu
ZyB0byBpbmNvcnJlY3QgcmVzaWR1ZQ0KPiBjYWxjdWxhdGlvbnM/DQo+DQo+ID4gICAgICAgICAg
ICAgfQ0KPiA+ICAgICAgICAgICAgIGlmIChjaGFuLT5oYXNfc2cgJiYgY2hhbi0+eGRldi0+ZG1h
X2NvbmZpZy0+ZG1hdHlwZSAhPQ0KPiA+ICAgICAgICAgICAgICAgICBYRE1BX1RZUEVfVkRNQSkN
Cj4NCg0KVGhlIGFuYWx5c2lzIHNlZW1zIHRvIGhhdmUgYmVlbiBwZXJmb3JtZWQgb24gYW4gb2xk
ZXIgY29kZSBiYXNlLiBUaGUgY3VycmVudCBsaW51eC1uZXh0IHRyZWUgYWxyZWFkeSBjb250YWlu
cyBmaXhlcyB0aGF0IGFkZHJlc3MgdGhlc2UgY29uY2VybnMsDQpzbyB0aGUgcmVwb3J0ZWQgaXNz
dWVzIGRvIG5vdCBhcHBseSB0byB0aGlzIHBhdGNoLiBJIGFtIGlnbm9yaW5nIHRoZXNlIGNvbW1l
bnRzIGZvciB0aGlzIHJldmlzaW9uLg0KDQpUaGFua3MNClNyaW5pdmFzIE5lZWxpDQoNCj4gLS0N
Cj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwODE4MTc0MTUxLjE2MDg5NzEtMS0NCj4gc3Jpbml2YXMubmVlbGlAYW1kLmNvbT9wYXJ0
PTINCg==

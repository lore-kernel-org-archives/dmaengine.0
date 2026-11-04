Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793782948;
	b=hq3RcauroGfRR71esAonQRoaWsjsJWacOSu28M/8xH62uhJKrzmzAMn9sVKHMgZAyBKl
	 T3+cblFcvXW6h6ZkgexlQWEz7jFEuLtUX3BNldj6wPzHok14vVAfBWZGtK0i2hxT35SYt
	 4IHkDve+BCbDOGtXbOxLXnywM+LVuZI+qEDWTrJu/CXcOIT3jTgavq20Gg31QCqpdMrIG
	 S5PDNYlGCunNkZ4F2WhkqiVNXN8TDDtdVAiJOqKBkrVsZEs9DN++h3Jj05qPvDcb7xt7B
	 QUVdoEKSwd576HAAzXvj6aDO/HADwJ+b4Ymic9x94TcNhr48Jct346knF+TU9PL7IFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5xCal3Tehs7RyOoxLuE7lxCR4hKUABfdY45rQ77Wjt8=;
	b=eTjI/K7P9O5o52E/aMKdRu+ZfRIdxxbOPieIHNxreTA9w5T9p/eqtisvVfgLnLHSp9iG
	 W2rtP2tWAk3n/FWE+R8GMbDwMyzeG3m+oRyJ9LVMAPVUA9Kf+vArdK3A15MWAW6c3rt2V
	 qHmhdVGBRBo8KO3fUT3S5fivUIrJMvueuURcISIFqhGtcgwruxhUp0ZVDOUYHPxj5C5zQ
	 KT6O1q7hDvDt2HSFVBQUaWKAwzvOHDJbPBEz50vHT+WjuvEi+vSWCnCdjPBvej01OV4s8
	 P/n6UaHgCcr80A2qtcTLy4MoqtxPWHExKPg6HDSjjQNGLgAbJdrViH5xUnL9g4ume3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=LCnCaROJ;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=VEi7F4Iw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F1606A31B;
	Wed,  4 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27F1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=LCnCaROJ;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=VEi7F4Iw
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48J4MS1287149;
	Wed, 4 Nov 2026 03:02:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5xCal3Tehs7RyOoxLuE7lxCR4hKUABfdY45rQ77Wj
	t8=; b=LCnCaROJtmgLDqxL1fJVXFw+HUGZuARRag8auwXfE7dCDIxhxg2ED/onQ
	Dc+rBgjVm9DnSJ2JkO1aFNAcFH1iJcv6I/By93XJpbVxNNfu5Rry3Iix4a+uoM/A
	t5BpQBJqTRLbLMuHih/SRB35Qhd/Y9DNMX3xaJUoSjxxGXFxyS+m2WaAY0rLy5rf
	qYaytaQM27gfF7/PhcH6XwnmM1NwHCq6/+CXbKS2Js3lYL0GTz/a7phNP+mdgFiJ
	eUNhMyDmH/QloqrEW6h/wt66YsE/z784oQViCfp0ffZUP0IcKnn9/KJ1Q+0JOSpM
	q7HhEm+eV7mhBJFt9Lh5nfj4oGdJA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hquyf1w2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 03:02:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhP5gvpvCKqSoZ/O7vRDVvTvuN3yITMLoo5YcwnPOrSjKnP3GtvvQEZS3cO4AGVtzAnEFO4Ui7zkozPiC3CD+ld5MFMQlSmL9VN3a4VcL/6b+BUpFMenK/BScwRhPdW8WgeddSOxJTjGaLvhV5iQ7MaiY4ebsM1GeuFdaeOLtxQyj0m1dYJF01cNqpG1QBB8wZKUXcksxRqzps2jUn9I2LIaJSnilT38oOW9yFfBicmpvBHsRq0kfmvFch8k+1XsUk6a/y89fjPho2Of9gCrTuJNGB2XHlqJlU1qWVovZGyislifChc00L+YfxLB4nJYmWF3ICMR6MXYKrLuyrN1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xCal3Tehs7RyOoxLuE7lxCR4hKUABfdY45rQ77Wjt8=;
 b=NHgESHBf+72qEG+ywTosi5HsnkHqsUUb+YaIv71bBoV2e43oFYdhJNIcggNwaWbnA5wolPHF3UIUMz3mFWD0CAsG8Y9TDWiJb8vt+0a7/NWgrPfqJUlsSaEp1F+Np3P28MbzEdZ9auWwFgNDKak0I8iQ2uQCrn4noh/ohymltg63f/jrH0HH2syEYN+xn6PEYlrAKsQ/gs3SHQb6Y5Ytujewf/IZb98yjpvc0cT04g8jxzJgCG+w8T6lrbfTf/bKtY/XCIC7IKUVTF9D3WDIjwsDwXQpwISeD0t2s+qgmZvE/42VAhotVtNHAQ9/ufJjfZ0GadPofLgntkiabq7+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xCal3Tehs7RyOoxLuE7lxCR4hKUABfdY45rQ77Wjt8=;
 b=VEi7F4IwGwbItAad06Q51Cd3JGOgFaQ1E0la935bq7/C2/vvBRrehT6OJcvPmeoi6L9/rIdN4EdaWzs6LHRCmTNitFd7K6oRiAtWZvHIJvTOakAG3SousMAbFlWrYu6/MLvrd9dMYXJF/+hb7P7xmNRqk/nGSCSTmtqfpQNP6ps=
Received: from PH8PR10MB6645.namprd10.prod.outlook.com (2603:10b6:510:223::19)
 by SJ5PPFD9B14F409.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 09:02:19 +0000
Received: from PH8PR10MB6645.namprd10.prod.outlook.com
 ([fe80::8985:7ede:7087:7bd7]) by PH8PR10MB6645.namprd10.prod.outlook.com
 ([fe80::8985:7ede:7087:7bd7%4]) with mapi id 15.21.0546.025; Wed, 4 Nov 2026
 09:02:19 +0000
From: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
        Vinod Koul
	<vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        "tony@atomide.com"
	<tony@atomide.com>, Daniel Mack <zonque@gmail.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Julien Panis
	<jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>,
        "Francis, Sebin"
	<sebin.francis@ti.com>
Subject: Re: [PATCH 4/4] dmaengine: ti: cppi41: Share register setup with
 resume
Thread-Topic: [PATCH 4/4] dmaengine: ti: cppi41: Share register setup with
 resume
Thread-Index: AQHda8rsuu1D8mtwU0ymOGdsexai17cdnsuA
Date: Wed, 4 Nov 2026 09:02:19 +0000
Message-ID: <406e1733-00a5-4a25-af88-a5304b4f4310@ti.com>
References:
 <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
 <20261103-v7-3-topic-am335lpm-cppi41-v1-4-d7213446c5f5@baylibre.com>
In-Reply-To:
 <20261103-v7-3-topic-am335lpm-cppi41-v1-4-d7213446c5f5@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR10MB6645:EE_|SJ5PPFD9B14F409:EE_
x-ms-office365-filtering-correlation-id: d7fb46f9-67e9-4939-fbb3-08df3a525498
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|38070700021|4143699003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003;
x-microsoft-antispam-message-info:
 pOTBcvhmQad16No6i6zmYkUBykbpTQcopM23z6iflKL7PZnTxCMh+tC4zYW/7dRNCcTM9v+ml9scM/smjjBXpNwNytM+Rdo0OmspbraN4C+C+s7EIx1zR+gj2Gogw9992noQdQwhFt4M1WGdE4QmIA5C+Nv4qYVGCrCPnLTiepyHnoVOXAVq12j5JUGix3OWsS3LhCvHRNYZuR/4CkJ39/ZfFG1Gbe4YrXCl2p2UOCAYHxuMAsNq6eYRRbZL5tXCHiw5NF2YRbCCKgWMECsWxRLBNivWsm21bYRcgMntFIHQBYsZV0dOeKb99kTPpzx9hoSNV6yhcj7VkL4i4whyA+UWA+tzxb+jaoiznvDfqyyy26GKMzYh5H4fRsATintMmUj6EpJBSirvFfu7kSOynMPL4vPczEAemcxL+5VotkF0qJnpZG+HWiORsrfgz6/CGimywcKfQ17/wm8RdGdbXx5l+Woy1HIqj17SKfwc1lFQauXzuthHMLSMWkDDZ8g5TiYKq10ch0deLjAuPeYxkyqB3nmvzfgKr5krHVYkNDOn3cTZmzFRNbid/cu0LpcZxun5vs9d4f6PM1k5R95d2Q0BQE4ES6/KIjOYc/geoagAV/Ym21w0ACqFug8u1VoTMc0mg5MMM+6gRBXLO2pvqzXOU0VBipaeMGrJDD/XgeOVxQsPsapaYy6T6tLk1Rma0KMNF9ML1/RA0oVuVbsCxLXRxcYEf8xmbjDT9GY/UIo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6645.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(38070700021)(4143699003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTh1ZFI5Q3dqcTBlWGlHNDE2bFF2ZkQ2dldlWVprdStSa0ZIYUNpYkpadWpQ?=
 =?utf-8?B?azFTbFRxc0t2c1VqdVV0QmJYc0VVbFdHTUJ2MDk5L1JTK25mbDZTbHpiU3ZG?=
 =?utf-8?B?eXh6eDlHWkNIMEh3THNWS0FjYU1idE4rUXV2d2lpUEVXYVRDdHh1RUU2ZkUv?=
 =?utf-8?B?bTh6K1FvVFFraDBxdG4ybEp6QzhhY3FuR3JkUEtZNDB3TUZVU0FMbFZ3K1VW?=
 =?utf-8?B?RVFVdmZmbkdrK2Q4b0dvMXFDd3RXakFTcGxYY3hlWFkzVkE5c0JMellEeC8z?=
 =?utf-8?B?Ulk4ODZVdWRDSmFSYXRoS2p5eitMMmd5MTA0M29GbkVxbGhsdHI0ZlJxSHY3?=
 =?utf-8?B?QytHZE9VelBieFFhc3FrWVFNTk9PUDl6QkszWnBJODkvZys1UnE0akFtb0NC?=
 =?utf-8?B?Q1U2M1M3YVlKVEo1QkhzZkkyTmFIWGdXcUd6dVE4Wm8rVThpSVh0ZmRUOHhZ?=
 =?utf-8?B?dEs1UVpPOTE0bGZYaDIwQXlGTEtTKzd0UW9odE9WYklDWGpEWFd6SGhVaWwy?=
 =?utf-8?B?OW9vSnA0YVA4aXdVYVc4RC9XMkdpSUVhWkcvUlMzMHJaeW5XNDJhdWFyYXFM?=
 =?utf-8?B?bnBudzRISnVudDRJbmkwZDMxT1RFOU00WnFIbGR2aVlUdzkwY3kwODBsOXFi?=
 =?utf-8?B?ejRrRmNaSS9aM0Ftc1ZPWWJFMDFoZmdvREVqOUFUZkVXQ0E5bUd6U0kyYXcz?=
 =?utf-8?B?WmNTT09NQkdJOXcrTDB6M1pVZ2x5aTNiOEtrdE11SVkycVRGdUVVVW1id2tX?=
 =?utf-8?B?dTFScFdQMUVzbVVuOVNxWlF6QWhkYWxpTnB4dTlyS3lWaGxZWm1lWFIzOWk2?=
 =?utf-8?B?aDhUOEp6SHNPQ1FsY091OGpSeWJxdGxubUZQMm9zMEJjMDAwa2VrcE9Xd01p?=
 =?utf-8?B?UVVmN0NFR3ZEem1jVXUyR25jTFQyMXBPUkRRdGErUjN1ZnR2OEtyZ3c1Y1RT?=
 =?utf-8?B?VlpkUnZKUUIxYlJwbmJQdTA4RXVVbmx6aEJYM2xGT1l0Q1BOV1paNGdvNDRr?=
 =?utf-8?B?alpueEl5RXNZUDJzR0Z0NEpnZlZuRnBaU1o2YTdMZi9QZnhWYnZqakZPTGg0?=
 =?utf-8?B?Qjk3bVdpT0dsZ1J6L2h6ZXhweHhqNDcvcDlxQ2tSRWtqSEhaa3JiZUdKdWUz?=
 =?utf-8?B?MVFPdzNOVWNML01ha1Jsa3ExRUVjUTZ0WG1yNkY0MmJSQSs3RHJ4cEoxUXZx?=
 =?utf-8?B?SERDWHN4V01JMkNobkxQcWMySFk5bUluYU82MUlCcnNOcXc1V3NZbGM5a2VT?=
 =?utf-8?B?enpXZHFSYUw0VmUvVStCMTA0bk5KS0g2ZTYvYXhqeldBZGFGeUdYeTUxYlhE?=
 =?utf-8?B?M0ZnSEdQSDhpUzdVTHJubWhIbVJyb09oOVd5eWhHTWltQTdaQTdKSk5nTWlu?=
 =?utf-8?B?MzVGWWV6aWcvZGZlV3pZcXp5QjZzNDlIejd4ZTlkMjM0QVhwRXMzTFFPSHd5?=
 =?utf-8?B?aFhFYndzU1BQb3hDUStiY1J3Y0o3RU9ZOGtIWEx1ZnZLVERGdzJ6TFhDcTFp?=
 =?utf-8?B?V2srUFgvenh0bTRPSHljMGg0OXpDZDhRSGpxWlp5NHVLVGZLY3hSckNGR2Yv?=
 =?utf-8?B?YnFCQm1vUU1vWGJiUUlkYy9mbkhtV1hVcjhLU1UrY2VkdEVxc2xNdHVPeG83?=
 =?utf-8?B?TGxjSnNRUXBHaGhsVkF1VXVtMlAxOXBENzQ1S2NjN2VpY1VBdHI4YWJ2bi9O?=
 =?utf-8?B?aXFvRGlaWXJyMkdzT3Bwd2VZeiszSHM2M0swTzVtQ0YwT09BeTFMUDJROFRn?=
 =?utf-8?B?QWJBb0lPckRTWHJ0dVZQTkZhclpQTEM5d3Bma2R6UmdEY2JPRnBVUk93Ykgy?=
 =?utf-8?B?UzZiU1YrcGZuYWk1eng2c2IxdFJLNmRHMy9xS3dnOW9aYVRneVA4V2doaGJC?=
 =?utf-8?B?a0NwMXZpamo1aHVaQ3VNYkh6UXhMRjZRdFdGaW82YTh5NnZwSHRKTmZNMnh0?=
 =?utf-8?B?Q2szb3QrRE50R1EvQmFTS2JkdHB4c2dVaUVMRVhkNHNFeGVEWWdmU0laTU5s?=
 =?utf-8?B?WnJQUFh1UUZtaUhibjVNWFlSVTVlUVB0bGxlanJvOXE0VUNvOUJKUFArZDdG?=
 =?utf-8?B?aExxMURaSklSUldxS0NMNXEzdmk4NlAwRlhETDdsMjFocVdvQjM5a21xalMz?=
 =?utf-8?B?eGREU0piMUE0ZGs2SGJ3ZHdhOXFqZWRNTHRjRGVwNTdibnUrMGtxVGFlZ2xa?=
 =?utf-8?B?Vyt4SlRSM0ZzRHZOTThZWlA5M2pRL1JxOURCeFZLdEdka25OU0pRVDZURmdF?=
 =?utf-8?B?QnNTVG5WcnNhM0UwVkVJekxMUDN2a1h3RDZlcjNuOTdjMThDWnZDSW00KzlE?=
 =?utf-8?Q?qE6OmpAHzUYkHx9lY9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85E72878FF2715439EFECEACD6809A45@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Ahd6FCKJO8AeIq1bavHvqMjBRMClviSk2ooy1wu9ts+ehkKXCZ4GLYRzVfZyohP6Q/8SqqgTvNPRGQQeGDOtiQ1Y7Cd62Rkjlm9Si7ryHd3O6EHc3EY3SXmDR4b9jB8MP2mgPtix/i9NeK8OAyIVj8bfy52RWjVLSwIOudNt4eD5U6SJDUS07vXquvElrk4HjDD8SjptRGwPF6QQZm/eMqQpT125Aeli1mxg/W5b3q2ETANpW8951/qyqG5NarKMOTBYsHWOHOQZpoXmo0aaIyQHnw3646LVXeUmaNlk7opOINUiRldRGwN4HCheAvuMbjp9otbpnLICdVIbyusSqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6645.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fb46f9-67e9-4939-fbb3-08df3a525498
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 09:02:19.0377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YupVgAkYjZ5tCf4OUPw5hgZG9yFF/d4dq1Kf7aW7tayoeULJWflY/NY9xMDW3fN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD9B14F409
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX2pLbG09tWNC0
 4KI7CvbmWyofNtIFDJNLJRlZkZOQxQA6VtDn9/HIdhmTb4tvRxSzenZFKfHKCeBVuDKCjUemm6I
 HHO9hVbTSNqZ1vNkRVQ8XzuZsdTrAvVbuYfyZN29UkfFYSeur5BEzLIQdzCKzsWX2eYtIVPjkMM
 jK5nrBMnGrTb28Q+Wh50GQpM3Zk1rx0ldon8QHMlHUIiBkQpCoSl56kN8Oip8pq0IB2KIeWuAB1
 JA1pTr9Mch2T5LvZpkTyaEG5/aWpnUjAq8AIrviAwAaVUKR5fc5m0Ya0g4I8B+ZJ92VHm/clyAj
 QX0a07oOi1l4vxYqEHIuohRRlq5XNoQapTSrGvj701mz7rWVJfToUGNKyuZo5ldKTZhsxb58Hjr
 f3bePxExvUV/4/XE8ELYM9CZjf+Hfkksc/r0rht0ZuN8Q/PmfTWj1rE2gPZ4vBkuW4kB9+2CVeG
 cDcFR+P4bSuva9f37Mg==
X-Proofpoint-GUID: OTZyapC-srDJmqedsoR1NINlVpXh-iyy
X-Proofpoint-ORIG-GUID: OTZyapC-srDJmqedsoR1NINlVpXh-iyy
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6aeaf49d cx=c_pps
 a=B1kIKGfTVomdQYahC0fm5g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=IpJZQVW2AAAA:8
 a=sozttTNsAAAA:8 a=uEqTqNBrif_xVfBscoQA:9 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX80uyv13SN11L
 /8zr9o9zUdhd2nvDzjwagN1iEeinJhZ41xi1WtipPxZ2EItAGkVwso3a5/WRQw7q7+DRt9Pzy2m
 jkLIikyGOu7qsuyhL+aF7UDnLx9pSE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040035

T24gMDQvMTEvMjYgMDE6MDcsIE1hcmt1cyBTY2huZWlkZXItUGFyZ21hbm4gKFRJKSB3cm90ZToN
Cj4gQm90aCBwcm9iZSBhbmQgcmVzdW1lIGJhc2ljYWxseSBkbyB0aGUgc2FtZSB0aGluZyBhbmQg
c2V0dXAgdGhlDQo+IHJlZ2lzdGVycy4gQnV0IHJlc3VtZSBoYXMgaXRzIG93biBjb3B5IG9mIHRo
ZSByZWdpc3RlciB3cml0ZXMuIFRoaXMgd2lsbA0KPiBhbHdheXMgbGVhZCB0byBkaWZmZXJlbmNl
cyB3aGVuIGNoYW5nZXMgYXJlIG1hZGUuDQo+DQo+IENyZWF0ZSBhIHNlcGFyYXRlIGZ1bmN0aW9u
IHRoYXQgaXMgdXNlZCBieSBib3RoIHByb2JlIGFuZCByZXN1bWUuDQo+IE5vdGUgdGhhdCB0aGUg
b3JkZXJpbmcgaXMgc2xpZ2h0bHkgZGlmZmVyZW50IGJ1dCBJIGRpZG4ndCBzZWUgb3IgZm91bmQN
Cj4gYW55IGlzc3VlcyB3aXRoIHRoZSBuZXcgb3JkZXIgd2hpbGUgdGVzdGluZy4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogTWFya3VzIFNjaG5laWRlci1QYXJnbWFubiAoVEkpIDxtc3BAYmF5bGlicmUu
Y29tPg0KDQpSZXZpZXdlZC1ieTogU2FpIFNyZWUgS2FydGhlZWsgQWRpdmkgPHMtYWRpdmlAdGku
Y29tPg0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9kbWEvdGkvY3BwaTQxLmMgfCA0MSArKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZG1hL3RpL2NwcGk0MS5jIGIvZHJpdmVycy9kbWEvdGkvY3BwaTQxLmMNCj4gaW5kZXggZTJh
MDg5MDY2YzZkLi5iNjJhMjZjMjY1OWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hL3RpL2Nw
cGk0MS5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hL3RpL2NwcGk0MS5jDQo+IEBAIC04NzMsOSArODcz
LDYgQEAgc3RhdGljIGludCBpbml0X2Rlc2NzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGNw
cGk0MV9kZCAqY2RkKQ0KPiAgIAkJCQkmY2RkLT5kZXNjc19waHlzLCBHRlBfS0VSTkVMKTsNCj4g
ICAJCWlmICghY2RkLT5jZCkNCj4gICAJCQlyZXR1cm4gLUVOT01FTTsNCj4gLQ0KPiAtCQljcHBp
X3dyaXRlbChjZGQtPmRlc2NzX3BoeXMsIGNkZC0+cW1ncl9tZW0gKyBRTUdSX01FTUJBU0UoaSkp
Ow0KPiAtCQljcHBpX3dyaXRlbChjcHBpNDFfbWVtY3RybChpKSwgY2RkLT5xbWdyX21lbSArIFFN
R1JfTUVNQ1RSTChpKSk7DQo+ICAgCX0NCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiBAQCAtOTAz
LDYgKzkwMCwyNCBAQCBzdGF0aWMgdm9pZCBpbml0X3NjaGVkKHN0cnVjdCBjcHBpNDFfZGQgKmNk
ZCkNCj4gICAJY3BwaV93cml0ZWwocmVnLCBjZGQtPnNjaGVkX21lbSArIERNQV9TQ0hFRF9DVFJM
KTsNCj4gICB9DQo+ICAgDQo+ICsvKiBQcm9ncmFtIHRoZSByZWdpc3RlcnMsIGFsc28gdXNlZCB0
byByZXN0b3JlIHRoZSBjb250ZXh0IG9uIHJlc3VtZSAqLw0KPiArc3RhdGljIHZvaWQgY3BwaTQx
X2luaXRfaHcoc3RydWN0IGNwcGk0MV9kZCAqY2RkKQ0KPiArew0KPiArCWludCBpOw0KPiArDQo+
ICsJY3BwaV93cml0ZWwoY2RkLT5zY3JhdGNoX3BoeXMsIGNkZC0+cW1ncl9tZW0gKyBRTUdSX0xS
QU0wX0JBU0UpOw0KPiArCWNwcGlfd3JpdGVsKFRPVEFMX0RFU0NTX05VTSwgY2RkLT5xbWdyX21l
bSArIFFNR1JfTFJBTV9TSVpFKTsNCj4gKwljcHBpX3dyaXRlbCgwLCBjZGQtPnFtZ3JfbWVtICsg
UU1HUl9MUkFNMV9CQVNFKTsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBERVNDU19BUkVBUzsg
aSsrKSB7DQo+ICsJCWNwcGlfd3JpdGVsKGNkZC0+ZGVzY3NfcGh5cywgY2RkLT5xbWdyX21lbSAr
IFFNR1JfTUVNQkFTRShpKSk7DQo+ICsJCWNwcGlfd3JpdGVsKGNwcGk0MV9tZW1jdHJsKGkpLCBj
ZGQtPnFtZ3JfbWVtICsgUU1HUl9NRU1DVFJMKGkpKTsNCj4gKwl9DQo+ICsNCj4gKwljcHBpX3dy
aXRlbChjZGQtPnRkX3F1ZXVlLnN1Ym1pdCwgY2RkLT5jdHJsX21lbSArIERNQV9UREZEUSk7DQo+
ICsJaW5pdF9zY2hlZChjZGQpOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGludCBpbml0X2NwcGk0
MShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjcHBpNDFfZGQgKmNkZCkNCj4gICB7DQo+ICAg
CWludCByZXQ7DQo+IEBAIC05MTMsMTYgKzkyOCwxMSBAQCBzdGF0aWMgaW50IGluaXRfY3BwaTQx
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGNwcGk0MV9kZCAqY2RkKQ0KPiAgIAlpZiAoIWNk
ZC0+cW1ncl9zY3JhdGNoKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+IC0JY3BwaV93
cml0ZWwoY2RkLT5zY3JhdGNoX3BoeXMsIGNkZC0+cW1ncl9tZW0gKyBRTUdSX0xSQU0wX0JBU0Up
Ow0KPiAtCWNwcGlfd3JpdGVsKFRPVEFMX0RFU0NTX05VTSwgY2RkLT5xbWdyX21lbSArIFFNR1Jf
TFJBTV9TSVpFKTsNCj4gLQljcHBpX3dyaXRlbCgwLCBjZGQtPnFtZ3JfbWVtICsgUU1HUl9MUkFN
MV9CQVNFKTsNCj4gLQ0KPiAgIAlyZXQgPSBpbml0X2Rlc2NzKGRldiwgY2RkKTsNCj4gICAJaWYg
KHJldCkNCj4gICAJCWdvdG8gZXJyX3RkOw0KPiAgIA0KPiAtCWNwcGlfd3JpdGVsKGNkZC0+dGRf
cXVldWUuc3VibWl0LCBjZGQtPmN0cmxfbWVtICsgRE1BX1RERkRRKTsNCj4gLQlpbml0X3NjaGVk
KGNkZCk7DQo+ICsJY3BwaTQxX2luaXRfaHcoY2RkKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+
ICAgZXJyX3RkOg0KPiBAQCAtMTE4NywyNiArMTE5NywxNSBAQCBzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIGNwcGk0MV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGNwcGk0MV9kZCAqY2RkID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICAgCXN0cnVjdCBj
cHBpNDFfY2hhbm5lbCAqYzsNCj4gLQlpbnQgaTsNCj4gICANCj4gICAJaWYgKHBtX3J1bnRpbWVf
c3RhdHVzX3N1c3BlbmRlZChkZXYpKQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgDQo+IC0JZm9yIChp
ID0gMDsgaSA8IERFU0NTX0FSRUFTOyBpKyspIHsNCj4gLQkJY3BwaV93cml0ZWwoY2RkLT5kZXNj
c19waHlzLCBjZGQtPnFtZ3JfbWVtICsgUU1HUl9NRU1CQVNFKGkpKTsNCj4gLQkJY3BwaV93cml0
ZWwoY3BwaTQxX21lbWN0cmwoaSksIGNkZC0+cW1ncl9tZW0gKyBRTUdSX01FTUNUUkwoaSkpOw0K
PiAtCX0NCj4gLQ0KPiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGMsICZjZGQtPmRkZXYuY2hhbm5l
bHMsIGNoYW4uZGV2aWNlX25vZGUpDQo+ICAgCQlpZiAoIWMtPmlzX3R4KQ0KPiAgIAkJCWNwcGlf
d3JpdGVsKGMtPnFfbnVtLCBjLT5nY3JfcmVnICsgUlhIUENSQTApOw0KPiAgIA0KPiAtCWluaXRf
c2NoZWQoY2RkKTsNCj4gLQ0KPiAtCWNwcGlfd3JpdGVsKGNkZC0+dGRfcXVldWUuc3VibWl0LCBj
ZGQtPmN0cmxfbWVtICsgRE1BX1RERkRRKTsNCj4gLQljcHBpX3dyaXRlbChjZGQtPnNjcmF0Y2hf
cGh5cywgY2RkLT5xbWdyX21lbSArIFFNR1JfTFJBTTBfQkFTRSk7DQo+IC0JY3BwaV93cml0ZWwo
UU1HUl9TQ1JBVENIX1NJWkUsIGNkZC0+cW1ncl9tZW0gKyBRTUdSX0xSQU1fU0laRSk7DQo+IC0J
Y3BwaV93cml0ZWwoMCwgY2RkLT5xbWdyX21lbSArIFFNR1JfTFJBTTFfQkFTRSk7DQo+ICsJY3Bw
aTQxX2luaXRfaHcoY2RkKTsNCj4gICANCj4gICAJY2RkLT5jdHhfbG9zdCA9IGZhbHNlOw0KPiAg
IA0KPg0KDQo=

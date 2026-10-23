Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792752905;
	b=zlFcsN+orU6AbA2PTsnYPRFKVEgKkkt9UG3wU8mFJbKt40ohuErlGNBR8D0vz2elJ4RO
	 a2JVekGy0WE4eSvc5Uw6HSilv65NuTmFk5GxF47EMqCa7KDd84wjQ2/sMxY9WiT2t26Q2
	 tDrYdVAondpjIv/Mbz2CJkPQA8VEYoKb8Dh6q/q/5qnvUt6QEVxNGbe48vlzBEzzTfjn8
	 f40s/Ekp1cJfx9mEEZlgTVyPaCaMZYh+fo/aqWVNQs5tdC2N+nkNEOtse49AWtoWxE+RO
	 WYdAd81BmXIHZQ/I5Wb/TA0WKYT+B3uWbIr7kHbv6PGCjqoT1zQdxI8+lIY1nNJ0IHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752905;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HFS2WWWNu6Yo9pmCyQL84y4+WOv3nUQpbwXEzUnMz3M=;
	b=p76ln2q0jL2spi91LaDx/quCubWxrnRCmF+KpOgL9UCp9tH+jF0boLL4mlkBrPlphB3G
	 JAF1hOCvJxXr3oph6TI0h4LNNVH5Fwa2YSA3DybAHtVZ4V8yz53eDqxkjQoz4pyQYskoG
	 +W++5Qkpg8G3xcJ/VD+/BFR/HDYpxwLdeDnAkz2FnmyaGCGanrbKzlzVutFwJJ5ozJqRP
	 DWq/R30gnmIxXfZxXg+ONejTFLiH00g8kta1SLGLKTeoXILDLV5MFAGNm+DRv3y6TfDmU
	 bIahoS+g7h1yjX3Oyn9Tk4mN+EJyVt2RTDYLLXVK3Cj49dJFnOvoawkEvMo1TFwmwaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eod3GzVt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D105606A324;
	Fri, 23 Oct 2026 10:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D105606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eod3GzVt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPbicBauXZdgTqWpZ9gcU12tNM1Lbgio1B3vvAu7WkPOBrRmoE+aA5/h8f9j8ZfknBxdjU5l6akPJUVAJpzjuzxXvn91CjzoOwQCQnq212xr6r/AFoi7UWmf7E8zTP2M7X7fFx+XUZI1QTkvYUkwuRobY50Ngq+QBjT2/7IfaklR0SxKjp4j4yib2l4KyaxjB1ic034CRXsb+oC7vol7Yzw94M2+qoyJl+Rt0kgHwNjILPrhuG18d2D6drAtiLAtSwEnvLd1QCYQSXX3QYCz5zomSpXD/Etq7LkLY4RYjIGpHLFanhqHpddsHAJckBv/GOOPQq/y/fUKqNRc3e+Z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFS2WWWNu6Yo9pmCyQL84y4+WOv3nUQpbwXEzUnMz3M=;
 b=tce8/fLH6SVKo41O5npT98SYD9/F8RnmikjSAURtmEH78iyxDVYmknARU2aRp+D5ag40Di6Asf1NyEhHLMJFtmpYlYu+2o8XjCjwFNypAbfxVxzmay4aTnWtp95RpLd5Rp4Z11/kRF2yHaBIWmvIVkSsdax8m+s4aYnywm/o+BQiCKZ9BmYsGKrrYf/VrrdVvy+jePxqfy23mWpGYRNevvZWZ0bOuqgdC/A79imyoskaa2U0CoVdWKNnVY7iAR3M0Nk5AGcH0cwBG01/fdRiLyAo3suVy7WzFlTTsY9CxSpVSOHkM8Ypi8sL/4PNJBGXJxPy8VjhihSZCWbJhxwnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFS2WWWNu6Yo9pmCyQL84y4+WOv3nUQpbwXEzUnMz3M=;
 b=eod3GzVtdf0YEO7o+CpBZthenVKHaWeqFhcTJv8TYaw98oi2IRRNpkDr54rUa1KTCZ1W7vEc9AGk8ALIkM0lIq5WPb98ssqtKfeDAzzvVUeaNamBvwrLzE6dSTwGub5S6anyaKm3yB8X/3uH3L04LE99xvsNuuYDQFO1evQBpDIUsq6dEM96bhwN7PS1AVurEHshassleRyiH4SGDN+MLEjYlBD17R4MfmAqduF+k867KrqygFij92HY8ZMJZLsHovtCzP16iRruM9BnunIIW8jZ+jEg0TigiBh5EgHKrL3l/T8t1Yqkv3F1HT1utTzjZNKWDnZ00sM36FmWz+E4qQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV4PR04MB955734.eurprd04.prod.outlook.com (2603:10a6:150:402::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:55:02 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:55:01 +0000
From: joy.zou@oss.nxp.com
Date: Fri, 23 Oct 2026 18:59:10 +0800
Subject: [PATCH v7 3/4] dmaengine: fsl-edma: convert DMAMUX clock handling
 to bulk clock API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-edma-runtime-opt-mo-v7-3-418e53c5f9b7@oss.nxp.com>
References: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
In-Reply-To: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|GV4PR04MB955734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2ab8fc-a39f-470b-54de-08df30f4166b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|261021121427099003|18002099003|10067099003|22082099003|261021123027099003|11063799006|261009223027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	NPZLrPkp3tdfR4yLiFIrbH03OEaBnbfY43Fh+o/cuyrGmpgCdBguS6n82YWauKA4geOOZ1aImv9YMK9HrnXgGVBEfHIGbuy5w3atce6VWQK9xL6FN7fHodT9lEeJok2TA+EjRyoLP1GsE+WLcUWkmv9vgWgsDSTb1MfBwoT5TjAxaz9HkWBFEY/Y+QYfGAasa0C4Ke6MUckLDIlEui7h5WcfXqRyNDrTAJLlMUb9HOGprBdSNnJvNjNX9TYx0V/rSujv7FaXDfUXI4gb7rCGe2TAR7yndbtMPpwIT+YkdmHsxTUZlr3fJRdMqsgtUcDt71RhKnuzRbibH0WQ7iP/pizzS31UaWypWZHilz/RMBeC7Z/VkoCR4lp3DM0URK/z3I12k6gNNACNnM3u/kdUk0oM+J5lUZnPq0za7WWxP+k5ChEyWSl8BwyZX0acDwaD28j5cOZLs8H3bTJ83DHxa6kQrDE9UDibENexZdnxMS2mLzRH5AKW9Ezu4dYKb0SLq9qQYev3zb9DbZCeMcsF5xX1BWtV1W6uUTQOyGWDhGh9aS+sL2Xvw79jGaKEyLNojxbfu5oImn6AtC4fAWDbC34JA2RollBHBfL5jv2/gOnxCSmmajudb0XXpLC1EkjL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(18002099003)(10067099003)(22082099003)(261021123027099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEZZdDErQ3BaeUVNU2VWSlUyZ2UwYWxGWGlYaXRyWmZ6TmJpSm5WaUNiMEtl?=
 =?utf-8?B?d1BISkJ1WFJ4d2VUZXhPYTlqdXFvRHBQMkxLWmFsVjNON2U4ZmNCSzhDbS9q?=
 =?utf-8?B?bklRWCtMWU1XWDhvaFhjNVVkMkFNMnVYeXZUWGl2RS9JNXBEV0drSHRPRGd3?=
 =?utf-8?B?VXRhSkZKY0thbEY1OUhVcFZTNktNQ3JoTU5VWkpyY3FmYlFvL1BhTVhBQXhI?=
 =?utf-8?B?OG1VdE15MkRvNm5HRS84R1lLVUhpN2Z6V1p5MTNtemt5cW9nSzk3MHlsZkY3?=
 =?utf-8?B?bFNrQU8xb2YwTytCbHBtbG8xRjYxWmNjcFlPdkMxY2NXKytwZnRmYU0zZ3Fz?=
 =?utf-8?B?Ym4wd2dXY1ZzQmpBb0VBM3JjNnBlYUN2QXZkbkxMTlo2ei95ZlVJS09vbzkx?=
 =?utf-8?B?eVJuU3ZsSEZSamF1ZnBBYzdtczNzRmhQa2FtT1NQOThvaTVxUVhSVXJwZUlP?=
 =?utf-8?B?UU40Q1BFTTZqRzBQVTdycTlVVnFJYkpDTkJ3T1VrVFNUN1dJTEFHcXhRejFn?=
 =?utf-8?B?VklOOEl2RUZIaEVZdjVad2l1N0Vtajk2MFUzTW1kMVgzdnZUcFFIejdGVXhO?=
 =?utf-8?B?aEkzWjNDZ2pXMktGelhUZGpaNVRnakFqeWhjejZSZEgrUGN0cGlJV0EwVmdk?=
 =?utf-8?B?Y08zeGhzeUo1QVNOUytLa083VzRHRmltdnNjQnNyVG5zVlRXaXlwdkM3NGgr?=
 =?utf-8?B?WDZ1WHZJc1JXMGVjOE11WGRuWFdURWdvQUhQQ0tRaGRUS2FIN294V3RmQk5W?=
 =?utf-8?B?RkNnMGQ0RVRxdW5wRkxXeC9WYjdWSUhDUWtmRzE5emlCa1JJSW9TWk4yb29h?=
 =?utf-8?B?VnptKy9ycEkwNVE3eDBBZ3JJU2srVVJlbWVMR1c2V3ZwbWRTNzg3UytzN1Yz?=
 =?utf-8?B?bklvbXNlb0x2dTV5RnFVemtrNCtSajZLQk4wdmFUQXE0R0lwWWJSM0lNNE9U?=
 =?utf-8?B?SG5VaEdCVkZyUlVkL25NMXUvNEVFdEVQYlUzTml1WHAwU2dVN0RYNThMQVVp?=
 =?utf-8?B?ZHRkOXJpL2s1Z0ZZWFpraXdJWXJLalNkeFRMdlM0OU01cEUrYUY3cFhndDR2?=
 =?utf-8?B?ZlpFQXRlM21ISVA3ellOREdKSjdNVStlNXZSWHhMckIwMFlpdHduaFBkalZI?=
 =?utf-8?B?ZEN3NUxrRkZJazFkVmpja2JIM29nbGNZWXpPVkVNYTd3V3RzSlZ5MWVvNUhz?=
 =?utf-8?B?NStJV1ovc2NlNkhCY25BL1R6S3B5SzJ0MUJpOEp3TTZ4Tm4ycWF4ZVNiMi9V?=
 =?utf-8?B?b3FxN3E1L3NLby8rbGE5b3gxcWRreGtndVZuYkpRWlVWSDlyN3dDWkRUR09n?=
 =?utf-8?B?c3QvUlg0KzUyQ1FGVXhld3ozVnJJTEE5bnZ5R0dNWlNCREIwdFkwS0JyanZ2?=
 =?utf-8?B?ZjhpQnRYa2w1dWVvdVRQT3lrd3h3NTl2eTcvdU1vbUFBQnljNjVTbGZpZTcv?=
 =?utf-8?B?aU1xeXVhYzI1NWkrUllsRXJLYWJKcFlZTjZ5bFhFUTcxQm1zQWNkM0pRMy9j?=
 =?utf-8?B?M1JUTytkTnRKSjUyNXBKcXRTYjFiTE1JT3dwUkxlTnhveGR1NFZYZG9MOGg1?=
 =?utf-8?B?a1BjS3RORUhwZUpNRGJyTlVzaFRpMUxrUHovcVU3dlVXd25nQ3Bya2Z1RGVy?=
 =?utf-8?B?RFF3aHpkbWR5cHAvZHJUaXM0WXJJNXZSL1BJL25rMlI1YW8xZmNWd0hzb3Ja?=
 =?utf-8?B?NkRzYmdQU0IzKzdqYlpMM0djVW41TkZmeWdxZlRnbktwek5XRE9QaFNBVVVv?=
 =?utf-8?B?dC9DTDZuK1VrMHlpLzFreTZkRDhiSi96UlI4QnV0WFhJeDNaazB1Sit4eEZT?=
 =?utf-8?B?Zkk4aUVRSXljYjZ0QmVlVkpQQWkvbmFlMlZuNTRSR0pCN283ZFVhYXJnTEJT?=
 =?utf-8?B?R3VSTlFEN0V6dDd5Zk5uRklmbjBaRDU4TFczZmQ3QTJaQnVwclRvUkNUV3FC?=
 =?utf-8?B?dEZOR1BDR2VoV21SVDYwNU9qd09GdjVUaFBvSEo3dS9FZ1JwZExIZmM5MFdY?=
 =?utf-8?B?S2orYWNEUnIyQUx2UElqOHlsZWZYY3U0OHB4UFdHYXNWdkFRbmJiUFlVQVov?=
 =?utf-8?B?REJtWFJ4ejdFaUw4UWpoWWM4UU96Sm9uVVpWeWhOSFZuZzJZbElmSzlOTDQw?=
 =?utf-8?B?S3JIOUNpRGZ3SmF3ZVhGS2plTUp1UTEzdlRGeDFvSk5KSnAyVWNVM21BbG1y?=
 =?utf-8?B?NEVHUFdMSWhHUVp5V1Y5SmZVS3A5UWF0NjhCSkZuSlBXNDFWUXRuNFhUa1Zt?=
 =?utf-8?B?Q1lPVisxQ21mWjB4Tm04VEMwRVYyUnF0RlJZOFpEb0FySDNSSW8wVk9mSHdR?=
 =?utf-8?B?OFFaMHBzblAyR29nOE5MQnNFYzFub1hOei9iVlB1VUdLbURJMjNxVXBvWmF0?=
 =?utf-8?Q?cwY2EL/QHNuBf6QFuUev+/a1tcNtBAuGT1rwU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2ab8fc-a39f-470b-54de-08df30f4166b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:55:01.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q4oJ/LoyTEYLudtAl3PKXdzQNCJEFYY5F5PyncB16r2Os6L4JKhjp2/K8WsDqbrVZhP/c33QxoVKLg62of/t+Q5tG/xxMPzpHUCg7oO47f1UjvLoJdPqhuzP/BiAlkT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB955734

From: Joy Zou <joy.zou@nxp.com>

Convert the DMAMUX clock management from individual clock operations
to the bulk clock API to simplify the code.

Prepare to add edma engine runtime pm support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v7:
- Replace devm_clk_bulk_get_optional() with devm_clk_bulk_get_optional_enable().

Changes for v6:
- Replace devm_clk_bulk_get_optional_enable() with devm_clk_bulk_get_optional()
   and clk_bulk_prepare_enable() in order to use runtime PM for power
   management later.
- add Reviewed-by tag.
- Link to v5: https://lore.kernel.org/imx/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com/
---
 drivers/dma/fsl-edma-common.h |  2 +-
 drivers/dma/fsl-edma-main.c   | 41 +++++++++++++++++++----------------------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 97b3a9872e90..12db403204c5 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -260,7 +260,7 @@ struct fsl_edma_engine {
 	struct dma_device	dma_dev;
 	void __iomem		*membase;
 	void __iomem		*muxbase[DMAMUX_NR];
-	struct clk		*muxclk[DMAMUX_NR];
+	struct clk_bulk_data    *muxclk;
 	struct clk		*dmaclk;
 	struct mutex		fsl_edma_mutex;
 	const struct fsl_edma_drvdata *drvdata;
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index bc94554bc36c..be9bd9cc6630 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -531,14 +531,6 @@ static void fsl_edma_irq_exit(
 	}
 }
 
-static void fsl_disable_clocks(struct fsl_edma_engine *fsl_edma, int nr_clocks)
-{
-	int i;
-
-	for (i = 0; i < nr_clocks; i++)
-		clk_disable_unprepare(fsl_edma->muxclk[i]);
-}
-
 static struct fsl_edma_drvdata vf610_data = {
 	.dmamuxs = DMAMUX_NR,
 	.flags = FSL_EDMA_DRV_WRAP_IO,
@@ -752,23 +744,28 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		fsl_edma->chan_masked |= chan_mask[0];
 	}
 
-	for (i = 0; i < fsl_edma->drvdata->dmamuxs; i++) {
-		char clkname[32];
+	if (fsl_edma->drvdata->dmamuxs) {
+		fsl_edma->muxclk = devm_kcalloc(&pdev->dev, fsl_edma->drvdata->dmamuxs,
+						sizeof(*fsl_edma->muxclk), GFP_KERNEL);
+		if (!fsl_edma->muxclk)
+			return -ENOMEM;
+
+		for (i = 0; i < fsl_edma->drvdata->dmamuxs; i++) {
+			fsl_edma->muxbase[i] = devm_platform_ioremap_resource(pdev, 1 + i);
+			if (IS_ERR(fsl_edma->muxbase[i]))
+				return PTR_ERR(fsl_edma->muxbase[i]);
 
-		fsl_edma->muxbase[i] = devm_platform_ioremap_resource(pdev,
-								      1 + i);
-		if (IS_ERR(fsl_edma->muxbase[i])) {
-			/* on error: disable all previously enabled clks */
-			fsl_disable_clocks(fsl_edma, i);
-			return PTR_ERR(fsl_edma->muxbase[i]);
+			fsl_edma->muxclk[i].id = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+								"dmamux%d", i);
+			if (!fsl_edma->muxclk[i].id)
+				return -ENOMEM;
 		}
 
-		sprintf(clkname, "dmamux%d", i);
-		fsl_edma->muxclk[i] = devm_clk_get_enabled(&pdev->dev, clkname);
-		if (IS_ERR(fsl_edma->muxclk[i]))
-			return dev_err_probe(&pdev->dev,
-					     PTR_ERR(fsl_edma->muxclk[i]),
-					     "Missing DMAMUX block clock.\n");
+		ret = devm_clk_bulk_get_optional_enable(&pdev->dev, fsl_edma->drvdata->dmamuxs,
+							fsl_edma->muxclk);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to get/enable DMAMUX block clock.\n");
 	}
 
 	fsl_edma->big_endian = of_property_read_bool(np, "big-endian");

-- 
2.34.1


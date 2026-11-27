Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790917;
	b=1ZuQSaZE3vmAshMzheUdahMoptj5WRLHtyELNGQXvrBD72GP9d5NN4FpdhCV2bUQr7ao
	 tbXwNgHTgpseUxWg4ZyhXRJEOQ4JhbVtYEExMB691rpqI09/8psY1XseWRLOhxpDmY1NF
	 qHGxeTlG64KOekUuzFTH4RUqJrMUaclqpNtyWJxY6D4jrWxFq8bde0rA+lKZdH8SzcJDi
	 L9paRFvT3RZu8dkMr0827h7x9HaRYVAVk2Q2p/It0h/7Z1UpBkJTIBgqRMjDfgjNCyBnh
	 RzNF0cRTyT60LRFgUoin7+Uho/ibV/Ca/ZwWiZ21PLjZpEdpJzvPFd6y8NEU8Z5ZqKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790917;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=R42ocNus/7FqRlQdga3UY2UxbB1TzljZN62m44VSIoQ=;
	b=YcqpfPcUHtYS+lDXKwmJG3H/T2v1uy8rdjb2v9iFtRVjxRQBURMwxNWmwFvqWzITRLJb
	 qSqNgvDVnFT13SoidU+ulD7to1OJ5DJCzATBjyQMsPyzGl/zlm5cvAjSFJnuDqe6RHgDF
	 IVxeUHzA9/6gGcDOQwQoVrUZriDwpE0NKs/scbCE57fqNx1WNOPTQoIMpkAGHrHQS5dkF
	 7cqNath5A3ouz/XMzJbZM9R78GETsgf88PNuSJJYQ6un4FaG4/KAZttZ6+nZABDr640Do
	 +7ISghDTz/A5E1E0IjBEq3+U/uigTqaG9pYkYFqyBZmQdwa3b32sMxPM2I6MUm/TQFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=asSJJfoJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.58
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781D606A321
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 14:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5781D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=asSJJfoJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WK6h1rGxmX0NBUurzF6gAioE2zqKoNPk3coe5Jqjled51iA5kj3HdveB8PpvkR3ARzKXlnjWVZqz0jx/3FTmYTz2bZ6Ii7QCdmgEbqcXWH4erTfHZJmqTvJjE0lX78C0PWZX0uVzvfGWhpwgoNkRsk8VARcH6LntEFae90Ih8Gg2sFp8N6U2oRj7S56IrPyGYdbfdt9OKCYX+mCILRUwXEUvQLFy8hEJfkmoNdO8YYjNeUynfMXrN3+CEgpQI568Bd32vtHqtoMI4T+bkRfjPrxg9MDISvaRiTUUpTeKIFdSHB3k/LtWE3KASXa23PI9CUFIlJIzRNIHb/O9EKML2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R42ocNus/7FqRlQdga3UY2UxbB1TzljZN62m44VSIoQ=;
 b=YvUkFqAu3Iw+wvtb/Cb0MPPkJQjxjVmnZ2Wj2lUNNJgiTesV6ml83+EPG4P6Bry4ClbukYUFv2H2lTI0zBm/AUb32Z+IiFGQ3gB6Dnur8paLJFsKXktdchpwjxwJ0mZGQZKfI7+QJFRmo+AMiBAyM/vq8niCIU0ZStP6WpjNAIhaxUSLpoQtElzoT91YTVuK0I0fMQE6L40w3eXEWa28a/KSD6/Rd40zuC6hjZFvEBNVWhErz0lqslAn7kYmenMPYe42fYhCgH/2enoQgCsZGkOU8NVFLmJBEWgIshucgkS1wxpq9AOTkb/XpyYD99KkxFybz+YjtLt8/Sd0D20UGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mail.sdu.edu.cn smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R42ocNus/7FqRlQdga3UY2UxbB1TzljZN62m44VSIoQ=;
 b=asSJJfoJ5zqpZiG0olm4+p7o3AF5g8iL38RYQ/joRtrgUBZztziwh2EvqAiDtJxgrKXwXAv0aff8JQldk4zGN33FcuxkCNkWXrqA9OdVSMOZH4UIpuBgDFe+1n2vdPCVWBjPKJjWlPYPeZRtRpXRbRFLs/cSyVawmXuDZY1jKKzUBZGXG+inJADCITIyEFdYKpJKvbPW6lvy5BfluM2xIHFkCfMjVKMrxwznUe9LXh4GAIQu5uoXGlyYed2u4/roFLaWXba4dU2S52ny2+xOijOWxMe0H93g3XzF5KyLmX5lSxRQkEGhWEXC7Jzn+e47Wg7Ir+2JGxfm3rigCC1Njw==
Received: from AM9P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::32)
 by DB8PR10MB3738.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 14:48:29 +0000
Received: from AMS1EPF0000009D.eurprd02.prod.outlook.com
 (2603:10a6:20b:21c:cafe::90) by AM9P250CA0027.outlook.office365.com
 (2603:10a6:20b:21c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 14:48:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000009D.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 14:48:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 15:49:34 +0100
Received: from [10.252.31.56] (10.252.31.56) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 15:48:25 +0100
Message-ID: <f2a156ee-55d4-4a00-ac75-bb51f1785a9d@foss.st.com>
Date: Fri, 27 Nov 2026 15:48:23 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dmaengine: stm32: Pair DMA provider registration with
 cleanup
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, <vkoul@kernel.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<cedric.madianga@gmail.com>, <pierre-yves.mordret@st.com>
CC: <Frank.Li@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009D:EE_|DB8PR10MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6473c1bf-59e8-46fd-cc47-08df4c957f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261028144727099003|261026140227099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	SrW9qepWu2aaSfaEg88TwG5qMqauZTqctXPOSMNu7YQVQjCbpYUaD3eQ0roa6ABxP3JpB/S+zvDTDXlqc6rNmaz8YqMOMgm7nidY8JDFdb3lijY09XULXNAE7yNIz5Z0SE8z2dFigCWCcCyXnLXNtBWDXJ3PAloMqCwX2dhSdffQ2EXcOsjqAW7vMJYmjVjjipAc4RvTkQgD6s2vJBaad0APdfqII+r+moGAN0m37Z5KuOKR8IE4DTilkRsoVast5+ls6vFhDCGK6vkSozZP3cLe18TzFENQewMHzVJNYluFD0XrlrVOxuVtgZooE2g/WkWAj3CiopWq1mDUZkT/mlR2XIPkbz/PwOpeuplrh6jvsFZ9OT26uNfV6//V1rt1h3DT36k+fuFLWvmCbg+UZ/zUaxBY7MquvmxrTNSmZHG6ByBPg5A/u51zFGK1EVScwe+NQ/VB+nG+0BeBFYYdeg62wJcIhos/9s7IZ/o/kS30SKUOtGeNeTrWUtTjdXpE1buIaZe4LRyUGG9WIqUVOjJDxJA5PhyQk0TCA4k2SFeMO6dkyX02h96NQZ44B5kmehZO7ZYVWKnD20psfCCvTsKZeS2tK6L6P9/qOsS9uSe6Yi3BRJSJZcvKFzqfLyQbnLaXOwSQzkcoYdTh9oCC47eFLQ5c3FlZyV5/Ijifw92Ec3N6Gh11VUoXcnc5RuLMZIkDNPI3TePaFL1K2/ZwSw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S9Fkm6JeElzi4M1hgR+Nk7shSyV4AroJ+47aLIJNy3ZGwuCF+W1K9h3fju6OCIHU0vJUAMkUfS/59aPco54WQLYDFD1xzHMKKZP7QN90YjnpuzjINRmebISSaLzdb9WC6GDMTJGiXkNbjecMk9oCh1aSPwhL6r1sDgG5/YRTlK8KsI/rdYE1BghkpnX16kiudVLLP1GYWEpz9ciOFdlcGdffA7v5qWaCUDSV45vIWorMk47fuj/8+s8JEccGNJjWln6uHJEyPoUmi+DB734YWXameQgbCnC7NVM2xt2Ns9o4qwvAEHSfYaU3vXSQSLncCZwpvpgGmLWQKQLFxU2Zwil/rUHNDEkPYXGt5Fi9sfIxMI7hqMiQdrx3WB2fvTnoZvqKNfHwJPLfkiBClpw+QmBAyyV7S3nxMGaXhxEzNZMxVrvOOeOsSPdGalO/EgAP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:48:27.8168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6473c1bf-59e8-46fd-cc47-08df4c957f44
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3738

Hi,

On 11/27/26 12:33, Tian Xuechen wrote:
> From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> 
> Unregister the STM32 DMA mux, DMA and MDMA providers when their devices
> are removed.
> 
> Tian Xuechen (3):
>    dmaengine: stm32-dmamux: Unregister the DMA router on removal
>    dmaengine: stm32-dma: Unregister the OF controller and DMA device
>    dmaengine: stm32-mdma: Use managed OF DMA controller registration
> 
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

These built-in drivers are not intended to be unbound at runtime.
STM32 DMAMUX routes peripherals DMA requests to STM32 DMA, and STM32 DMA 
and MDMA channels may also be chained.

Rather than adding partial removal support, I think we should set 
".suppress_bind_attrs = true" for stm32_dmamux_driver, stm32_dma_driver 
and stm32_mdma_driver to prevent manual bind/unbind through sysfs.

Regards,
Amelie

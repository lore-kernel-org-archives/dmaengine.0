Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793622248;
	b=OoCYnAMZlYMEi9k6Y/jwh7qfIPZN45sCQ/VD+eWFg1EETTP70y2VexG7mLxFxPd/0tFA
	 SVlyjSvojfWKbiHKyugpkIjE8JrKvBn4tnL6XvmJSN/N0hWYyVdqVAHhLUdc6Bua+Us7g
	 UVU1FdGbAei/+Agf4W/vEV9PY2SH5HAFvcedhfH8mXzfgPVPTgdB5Artn6WY1jkzsvfjq
	 UgiYTjOQUCYyOxg6RnhDulZpIAqbfBPua94xSQYD3qi8MYoaBQTZ4vKdtPSNciUz515nE
	 +/f0qDSpi1ZPOUqXSiBNwTdHKAMR/4tfyPR/Gc26GciYUM6b1W2vFWucwO0PBhUFvDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622248;
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
	bh=cEXyDU/ymWYGWyZc/8Wm7F9+IUTEkrP6YmnQggRmRHw=;
	b=KR/ECeYV5Dxe+B/ztgX+8LLo+BkHBShuW7Kx9Rao/YT08mdqw13qHIXJwypqlcUscXqF
	 YCGYUaHucW98Nm5IBe/zBS/ziXF2a7i+R/XcpZIvZ7P1OZERBCMpPmkqUv+/gkJL66BoY
	 IjSCk0LWqAqgRXh/OyGpNRlSHs0Z7N5go4rIp7OEUbh5p08tpM2RtWrJlzdITp6hDV76v
	 aVxHcSQlNiti5C2WnDXOue8fylLvEAhqkulhKsrwlMSG/8eDoEUExv+sZDNcbuOeO4q/s
	 hxuZFDpysmNad0Q3YBL9Gst+UvMXCjRe3zGsOwjvYpQowLdQIDLD9qYyyEvHJFgksEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=XLV8iHsV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.14
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79409606AA15;
	Mon,  2 Nov 2026 12:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79409606AA15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=XLV8iHsV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpaUBTk0OaGDoCY55lvZk2Ah3GoEYMgMAshHnjEYYATohLIllJM9sZC5v4mRHxntPmo/BCzzaYLszoKpxRwzKjr+Rr9zZ5WXuK0KHCw19h13eTMb/YyN5/TZv7BRFaMKtloVNUC6eWl8BOIKF/zt6N518yLSZt7UnrubGq6rQl+9T9glVIinRa0YI5HMoQ/Rdy4jIXApxEEGdk6QrEWZemilOM3IFhAzP1exDNGfOXjZ8g6mZPavz05p0ftPb+vvZVHmgRHAIyyoXSf67+NNWM9dwjM93gKsDf+X9Gw24v1u6rHzj0zi3/h48220dsr/GlZaemUGwYcPIoT9dYQ4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEXyDU/ymWYGWyZc/8Wm7F9+IUTEkrP6YmnQggRmRHw=;
 b=swcCvhAId206fjQVHvD2v4cDEOqen/4kQXQqIng3SzaGhNcCf0W1BoBhMhJcWdOhix+g7VCfy7oukbEL+AQs62gBE4Z9TYkPbpo+sGHMiMQzUr4xxTmyW1nkS6ouz2YPZJzztP7Gy6rEWn3sAr+GOkEzA0poZ3FvZYTKWpBJ0k/LOCYssPSOUCbKomn1Xsnf9cFBxkq6X1ABtKx3HQjp94Wc8EZxyh15xvV8ptn4fyUyICQ2Uk6k5vJ2IdfObmh3BJ9lbUDEOK7oiocINcne7WmVb71epS2guMtv4p4UwHTcdHLJYlifh2s/GyWFEKTQBCqE4WbqMqhsn9PKnBAR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=cmss.chinamobile.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEXyDU/ymWYGWyZc/8Wm7F9+IUTEkrP6YmnQggRmRHw=;
 b=XLV8iHsVuZEIA0UhdliNifHomg8ajCx2mLrJMV+hZwJVQQhk8VAM3CqOGXN3tn55EQQz2DW0xTrOQUWaIR/iHeskjmnCoyop4IT571t0Mpgfqv3lmwUel6snnnCkeMLQELPeynq/l8pK0pbvDXC6ZA1pVtf3qDEMZwDkIBV2cUoFXVEhWZDAmNLmP7n1sCNHa7+ls7vEzkFg23hCfFWs1To+TOL2QL8iKCvl0+fjAzto71V6TtLLePmqwVlRpgfNIGz9kD4brH+h4qswIrA0gJMW6LpdP7143VzIpwvIXsdVatE+kn3NmRZUxmOua1Z1l+hldlIo7LO2E2sHVmTx0A==
Received: from DB9PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:1da::32)
 by GV2PR10MB6260.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 12:24:02 +0000
Received: from MAD0EPF000008B3.eurprd04.prod.outlook.com
 (2603:10a6:10:1da:cafe::34) by DB9PR05CA0027.outlook.office365.com
 (2603:10a6:10:1da::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:24:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B3.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:24:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 13:24:41 +0100
Received: from [10.48.87.20] (10.48.87.20) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 13:23:57 +0100
Message-ID: <647985af-d758-481d-9357-a2d87c9ef91b@foss.st.com>
Date: Mon, 2 Nov 2026 13:23:56 +0100
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
Subject: Re: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in
 pm_suspend
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Vinod Koul
	<vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: Frank Li <Frank.Li@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B3:EE_|GV2PR10MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d12d02-7166-438b-5651-08df38dc2d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	erKGCvjKEBbs0ZEmAg9+zVQ1AbSGiCakmyuehknWn+TmwBXCdhmAIwFQK3pt0mfQHZJujGc+imKE6LgTqzHczUrjkkNSyuq2WYifesOmf+b3SZLiKncHr5cp8k6Lipu2rl3h0dMwYYSL70S7g6So7ZGZz/P6eAQTJ6kfGgbqbPJ3/vYz/lpO3tZriamAuRVnWCVFGYB/PUdq0uJoo8H+V4UuWNJq68MIg2QOtX0Q9IUF82tvtfS/+a5UC7LpTCODmI5f94wjWev/tXMqT+sHBtteg4zq/L2YtNR/gUbaqJaf8hVCOjBFdsXTTgTrGrw1XNuXpXF/a5rAEeGpVyRv0gQX7Kh9OraCn9l69D2tU2YjnHMm7Je9EWKWPw8pWpl4RcOAJhAf5QuuOF+Z1Iq/SwiVnxaF+fZ7ymWS4mtsq7cG6lcNBVbSnT2MWF5TE08+ZKJc57YTEL56g+lNp5AUhnGjV/PcKdyZ7zJ7BMXPwBd1prVS6plezVtPlwmAhgcYVpDuU8VbVCu+E5T1HCbi17vjy8zcvEOf5b+bGbqDnFmlvu7ILaT9b2L1qEXCMF89mTcea5Pu2e/VQEXI1QguBJ2Ar1r9wKNWgv3I48pfHDN2H6ydlzWaMt/JbNJ5Wi/IsR1v6A2v511mK5tJ23melyOk8zCrrAhpWvokNRp1lWDYITUBzDIRa4CEm6elaMa1wz+sizYZuzCnMVMbFrzVDQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bizfelx7kFTGxxxSIsLysyFjklWe/Y7lLxYsQz4JDRsauF6xJwpnb2TdzclGH97yIkcuQrKF83v7hcn4jMzlLsInWhmwbnZXxYHA8L+XiBn67ImRnyVztNibIcityCVSxms1Ha9zz5qMLWcQrU4UL8LkFZl6pvZTcLlzWJkU24UaEYCzS+S/QJEpI6d12UtS9qK/W6OloNwqCHnIZGyy1VN1RW4PPeMELew5+NyRWPUIK90rZURCfANvv1CSIUc70ZSgeDV4xJkLyC06iKj1oztaNuxGAOXbmRv80uUyPeKQVMeq7WeBjam2X/RZhY8pQbljEUxxyt72/ri5Hv+www5PWM424Th8Gmh6iwZ8hz/rMC7ubmY83JcjMVOYemp3N9UbUdEU0/eJxHVSC01ZGdAv/R0PrlQ08gSD3QpflGc7MU5IszSqxpgZIQBzrsNj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:24:01.3079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d12d02-7166-438b-5651-08df38dc2d51
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6260


On 11/2/26 11:44, Xiangwu Lai wrote:
> stm32_mdma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
> 
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
> 
> Fixes: 7cb819c856d9 ("dmaengine: stm32-mdma: add suspend/resume power management support")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Thanks for your patch,
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/dma/stm32/stm32-mdma.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
> index e3bbdc9ee..fe1ff4a00 100644
> --- a/drivers/dma/stm32/stm32-mdma.c
> +++ b/drivers/dma/stm32/stm32-mdma.c
> @@ -1785,6 +1785,7 @@ static int stm32_mdma_pm_suspend(struct device *dev)
>   		ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
>   		if (ccr & STM32_MDMA_CCR_EN) {
>   			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
> +			pm_runtime_put_sync(dev);
>   			return -EBUSY;
>   		}
>   	}
> 
> 
> 


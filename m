Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793616331;
	b=o48k/IeXT/vHz5a230ho8d0doz8MFglGEEtAzm7UPKVQ1UkfWB8u1833zUtgKgFeXbfw
	 PVTy15ei1FsouUuJKH6NsVfGlGEWHuX8tB+JpQAMlo5pfjyDbrzAnuB/qEfNsrxhc4kk/
	 FsM9HDINVWvSRXegg7wT7MwrOnRp6QraSB/0xZM7bHM5mgRwspDbCfOQOOQ8eIfNc9WvF
	 tTcTg1MdbKREWsWw3fkrE939Xojv7vpdsFvnGlgx6zgkHM0AT763qnFBt3JZfxzwKHaIi
	 Ff6h6wnWpPMl43fx24cUeVJ/Pi8BG1Te/RUeamzgpsknhoAGrEJMbMw+K0zAPHfHKXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616331;
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
	bh=zlPT1uJZoDqloCOMpDM5jIglaQZVtqtD3oz9WnkMUg0=;
	b=XWinRZ3O2Rs+dMo/1+jucEXhbsnAeNCBQ1qriSl5ijwco3qyKq+zmXV4inPRfFsUY42Q
	 kbY33S/NNEn3Hl9HjJx3LIGnbdP+/s2ybD2bfl1kgzQh2gxm8fhBWgsMn6nTfOOicnw+U
	 HBj1WeLLoky/JHwxCDS15z/OY/0RCukAz5GldRxd2UJwh8odnbks1L6LSDfwCpzeWFMnO
	 wxRxvketMyBmghT+Ej+GVySWJtyorxnzR/J3szNLgOHCqW8OJ9k6IkRH/EktzEN4Fx+aN
	 YG2M4VMTc6KvQMRiWD2980Mjy00kalPaYEwQ+RT5xCU+w8RuiXttRWIzHcEXBo6ugQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MKx6RD1u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.12
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31950606A324;
	Mon,  2 Nov 2026 10:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31950606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MKx6RD1u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ3pDHSDTGIurNN/kw8sJx3pM2sMNmce2tdyAbfaFVxMU/Twx99BwBEehPYJ15sW910tWNOidTBkL4eVFT7WVFHZ4SxKj64E/ANZamk3Os1GMnSvd5Uzqv2kB7GSvNmXzPcnsG4TfxScfLM6ORhIwPRQBkOV+TfkG9wEdsI/JsRebA2Zeejg9MUQOfIg+HMxD404xXV7YwZarRsbW47x1ZeZurDz1Ag67ikbJzhlDRpSJTAfWYmVvsC1huJGWL0fj780c37eNxHjTXTT31Qi+kEHl9WZayzeFSFnx+eWJzSwmYRoJJSzQlXlhxWiqqDx7hffYR8+NFnl9ZqlFs2gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlPT1uJZoDqloCOMpDM5jIglaQZVtqtD3oz9WnkMUg0=;
 b=SZrPPC2fZEiKibZdgXzmiM9m854FDhMbuyOGUSxv2EWuKUb4fXdZkeSH1XyVqYu8N76CvKu34x+83chxyi95O9LX5wRMh3kS4Ytx/F9xoS3KYHh4Ul/2L661T3Y6rqXPMtPO5mq33OyAaDqP+OGrbUMPDTkXkLcTWs7TR2HYHTj4II54svUHWWKubaF6nj4bJjGKNgcKUSv1X3utTVy128XCIsUrUBHEiPa2bmmMlbSrDhablM7uUnCRwlWFFTVOkkGIoFmXKzlw/o+f/a9RHu3I+9/lE5CL2kvv+HjLRdYPx0bXpmrRvlDJMuEFBA0JZ3FU2gXHwkIIY40LXdnsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=cmss.chinamobile.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlPT1uJZoDqloCOMpDM5jIglaQZVtqtD3oz9WnkMUg0=;
 b=MKx6RD1u1h515biU4rCwQjLw+owCldi5fXY/PHQQvBks5f53pLtW+PLtvN9//AsjSuMGlYp2j5ztXdsbnLad7aaIt9vY20sh/h/feFM0w7MpzlHVaekzNCto9trTOPPAN8yQVkQfpXvN+ie2nGDjcjk+9mTibSLxzUkI+WWLxL4B8ynX7rPGQEkctjFo12sgvw4NPc6jQfONa8R69KFriAONFw7qbaApmN3f9Oc7ewvs4vhwZKoHa8T22AUNCuV4WeIV1c6+JYRT/AiXAO+8cZeD3rBKnq75bmXYCmzv8Ug+3tMLlBA/SMY57p27NpBi+gA/Fx0xuRykyOS5pm+AJg==
Received: from DU6P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::16)
 by AMBPR10MB9273.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 10:45:26 +0000
Received: from MAD0EPF000008B9.eurprd04.prod.outlook.com
 (2603:10a6:10:53e:cafe::88) by DU6P191CA0059.outlook.office365.com
 (2603:10a6:10:53e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 10:45:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B9.mail.protection.outlook.com (10.167.241.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 10:45:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 11:46:07 +0100
Received: from [10.48.87.20] (10.48.87.20) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 11:45:23 +0100
Message-ID: <af072322-7e6f-4f15-a3ab-95cc9d39d1d7@foss.st.com>
Date: Mon, 2 Nov 2026 11:45:22 +0100
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
Subject: Re: [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in
 pm_suspend
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Vinod Koul
	<vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: Frank Li <Frank.Li@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B9:EE_|AMBPR10MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: a1150383-eeb8-44d8-ec1f-08df38ce66c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	2a9z7B5FXKJvVj4GDWZm4q38+iHne256Wjw4bNqfgTsP2w1KnWKUTLJKn+iJL2TJAG8RZVMnedrDsRsnIVeupXVw5bheHV8u0GE4SfjrRWrxS4O3X+20SWuJuKg4a19YLmsF5DrAaee4by5CsUEw4ZNEYRvNHuQ/UsJMJOJHJJafCxoQta8miF4tSlBdCu7mMICZjK2PdobkClU3iZpg/yR1UdmV3sNp5dLsjCvmiLKFR3QNS7D9WJR2pXpvH4ZueWh7dqOoZIJTLLMRqKC33+aHaf7g2hAc2JmiH6ySW9kcStjRdlz2vguDzMPbFH9xcCW/ZHND1xgmpjoXAvztn4xAM+OgqZb5CANs3dV+1CjNyy8iH2MmHNoQP5d2gK/Z/E4prFoTJJHpLCK2whDKXiBJq2CupMVcnuqoGthyICdPonk6Q3fx7wdLhtWg/HDED4/hee5R7vVOh8kbjwGqqEZMGHT+NGM97A9bxVwjbsxxeh3hZ6MFg4n1Y2AoMeTpF19rXtrned2pcS5QOG/T8/xRf1u368Wy0pr4Y8JR/MsoVCjoJ2hZTzoAHtfRUJKbzAwChKsMeIUy1LS8V6UWqecQYMW21/2ysyg5ZHJs+zfMThKGulzBq+Vdo9Fok4O9B9TFn0l0PKx2DuhVdB9/n5Ah49micfODldI5FtJCkVSwi1DNIrcPK/EfLHjYQbMI2AmPcvMS8oDo6X0RnaxL1Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T49K4RyKSd5zt3dKCTRjRSKMgRcqiZDFQ4vGRxxPIgD/16vNODkbcMbCl+H4U/gQX+A50DLFXZVvjk421QrYtx59AP3upxrmKq3UqLE3lGqOdJy53eRZY8C3y/cg8D8q347jGnUTUxT70ZaVgBsdVFiuyz/UOCJILGKg/rdv/nhcK8jEkbxzH/HqZQ0fUjc/DGLet3H8fhQT5q3obZlYGqw+BbE685Kh5mL/U3i5WJ7K9YCJJft3rsSQWVLes4xRpCDoLdZuA7ZqJ3E8TMAydGic8yu4bY6QtXtfIErEcX7gJgFX/p9w6oOhwPkIE2jTMupRy57C55/VVov+Uoqi/OaktXtSywnJ4wat38clXxk90TKmc9K/kB1SzaToHmRlshz519f7BOJOkt0JLnX4ZPX7QGt/klylKdfhQzAPibcU5619v828TlP3OkWnRgON
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:45:24.7225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1150383-eeb8-44d8-ec1f-08df38ce66c1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9273

On 11/2/26 11:41, Xiangwu Lai wrote:
> stm32_dma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
> 
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
> 
> Fixes: 05f8740a0e6f ("dmaengine: stm32-dma: add suspend/resume power management support")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Thanks for your patch,
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/dma/stm32/stm32-dma.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> index d3ad78562..2abe846a9 100644
> --- a/drivers/dma/stm32/stm32-dma.c
> +++ b/drivers/dma/stm32/stm32-dma.c
> @@ -1743,6 +1743,7 @@ static int stm32_dma_pm_suspend(struct device *dev)
>   		scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
>   		if (scr & STM32_DMA_SCR_EN) {
>   			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
> +			pm_runtime_put_sync(dev);
>   			return -EBUSY;
>   		}
>   	}
> 
> 


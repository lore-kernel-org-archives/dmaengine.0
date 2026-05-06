Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406EB3E3175;
	Wed,  6 May 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064850; cv=fail; b=Ghlue/H3nGLAuwnantozZyXI9Tdpu20QFpt2h7NBbCZu2lJ5TGEc93jR7YIpvXZLIolUjiwng2D9sPydavOdAoN/XFOM7T3URHu+O7VifdLx3akyOG/0o4rFx/rm2cjO8SiFCAQpXzN93LF40YqwXrk6yqdsmsxsup5jE8AFYHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064850; c=relaxed/simple;
	bh=dVooAN/FxqQhrD+68mmzCNNmqUWzCNpi9SDv+/O7MDY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROaFwu+3fuKXLJfL+rTd6Xx33drVxBSBLdbvsknwPF3OM3IPmm5ZbOkLneN71CSatZqq8ErCbFYvm6vglrR99brRNPfssea3YJ+/L5n1qGJ2jif5h6lu13n9hIHlEQ0AF40ExdulHikkFQaBHRARaqjd0cY6AKFWzD9NUNEmh6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lr1iuBfK; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lr1iuBfK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWoIvfsQxdbPtSLEIewa2ko9+QHg6mtPfkSIL7W+LbLI4jQsXykeDwvyt/Sl7SvclL06S6HzIGmNJAz1RymCjPir+BKLe60jjFfL9LHVHd/07E5Q+oLht/lAovRR5cjaht2wNAzWQ657nhMzQDfWY09Y1Q1y5ol19JvT5KBqfm5z0R1LrKotPtKqQji6GXSbblSAJWj7QeFETtwP54wwvarKGi5CM09ROkiokN2OCs0upr6bL9AyzCQb4QBxpTBWN2oMJ+JQMuqNlVOfq7Ndua7v+J2NcUGL18admx0cZ1ONY4yf9wcsF4B47CL1B7zCe9i8YLRhCQUnUu2Afm4kIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOl9ZCt4kL71i19iAlZJTn3kmjD5A6ynILXPVLDQO+E=;
 b=nyCVBfWJzHelUDeahPmthIZWbBNGV1TEvq4haP4HYw2r1BbXKjGJZ2ZMco1WeNjqv9tzJJp7dzX6N0QYRLwJKuERZ+eZTUozFqNBIu0SPBOJqcJrOQ2UR/CYQ/ohBbO/oxsjYg8SRPpkR4ABHhgjigHyL0gI0YUyURQtaQyZ8RXF01l95gzszHQf+yJLmiqO0tPqfzRRvbeG1a1mIJEfCv5GsbynfdLx4dq2H/5rqjHiBWIlOzGM4sX7kAT/bKsFOOTwimTNeLCph/AUcXLLXe1JGOAHMQyeMV2qis9p7ZO/v+zRmMWR0CkcGGsFVzfXVrx+9IZKQG89iTLzLgqrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOl9ZCt4kL71i19iAlZJTn3kmjD5A6ynILXPVLDQO+E=;
 b=lr1iuBfK4ouX9L8VawSY9HEcxEO0ZOnnbasbZDYUGepur7lfYHCvYGTV/mt0DwGapWj0EJ0TXwDlLpy5KSr7KPY7OMexOmU/oURMpnRmXSn74DZ/Jx4q0yE3DKRSCUa1JXcaqt5KEIZBmFV7DuJMxm6gY3CUCitasWiqu83dWfY=
Received: from SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::33)
 by BN0PR10MB5174.namprd10.prod.outlook.com (2603:10b6:408:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 10:54:05 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::bf) by SJ0P220CA0022.outlook.office365.com
 (2603:10b6:a03:41b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Wed,
 6 May 2026 10:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 10:54:03 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 05:54:02 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 05:54:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 05:54:01 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646As1fs916612;
	Wed, 6 May 2026 05:54:01 -0500
Date: Wed, 6 May 2026 05:54:01 -0500
From: Nishanth Menon <nm@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <vkoul@kernel.org>, <vigneshr@ti.com>, <Frank.Li@kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: dmaengine/ti: Remove myself and add Vignesh
 as maintainer
Message-ID: <20260506105401.sct7zs37oan2o7tl@coeditor>
References: <20260505164605.15878-1-peter.ujfalusi@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260505164605.15878-1-peter.ujfalusi@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|BN0PR10MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e6bb6d-7c7b-4840-d019-08deab5dc9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FB03XQD/m+0GQsvOYE8wTYQzd968txcHaZCddDb8MsB/BcjTR+bLOg4k6QdyLPMRyULEPi1b/boSj+SCX2I58upzxqYEnGrkd7eUKUzd73XqEyzjQ9aJyqvpsVDbypi1SJGT3zuxmhofYx6JHry93efxFLn4dW5DqryNqyjVhAoUyJKd0p+wiEgU2dO9AlqXRE50OBFRrm5v971MFqC73fez7xrzUbHWTo3NfpNRY56m3h4R1ymLScy9Hl0U3aZiq4ZT3BdVMXDZQKUj7ThJl0BtrKrJDc54SPmDfEzhgc57aX/PE7FugjkqO8eCZoO43EiO8S0ptUaf2uBzJuPwQiFXkjKn6dfX27KC2izLfoL42zc33dLSFmaQdkB+VPzq5scB505VkyVnJ9AeEiVyYVccch5hDUb0suMfhLVnbepjjz/w8Fhh0HvvXxMsu3+ODs4jkvHoQpAwwPWlSQiSfzWfkD9VQDqnlH4w6ofxFZWeIN5q2nnm6sWRnZf0ZVXgz8F7K6Fp8nquPtGkUGidk/R9WR9e2d2gTEViRbBfDF95jrC+QI2StVHqdgzoMYJHeu36GJVQBaJaa9FcnoIZ83W7/c5zA9nfEsAmc7F6a3meUb1DAoUMiITJGH9+WHSeIpEI+zA35EAmphwZ5cIUP4wBfbeKDbZIIXpI34zkup86A79ip2tFOAubEOvzyUGRw8+CFF/TQu8NPiSJSu5tW5pBlY1yrzxFuJfpWJDNlA8=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4tbhE5N6J7i9aQJ417K5Uhx+lDWb+1ukA+QyE1D+h1jcDRiHgNLZQGprOJEtO9aNVY8F/kNe0hdGNZN/CclF9hbIGpaeNemjHFt65AHzw79Ko4DaGD/znLwJAYfwHGk+yj6Y6MwVZ8Z/YYe3b6ogtkU/QVxne+OqpRr/wILUmd32+wfqlOeIZ1N3J5tyYsL//xvMTc6DQpUbBa/iXi4usxlz7HNpRLuzKOSIvMrNGyJ9zglBh/IzwjuqhFltFDq038/EbZhI1jgRv20OeyKp05vuy25e529wZw8pePpe+giqfhUHTCU6na/xzzLHCkkuL/Qkg8EvSHxUd/u4wZzwENm50m27VE1WX7h6n/bFpS6aecDInnLKxGAhBwxWa+yDJ2Y1xM+XH3l5JxLPDSn9IgCt9EDRInFtx8XafVOCx5A+6E36Ss0JIVDvkHayqOst
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:54:03.9230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e6bb6d-7c7b-4840-d019-08deab5dc9e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5174

On 19:46-20260505, Peter Ujfalusi wrote:
> As I cannot spend adequate time to fulfill my role as maintainer for the
> TI DMA drivers, it is for the better if I resign and hand over the role
> to Vignesh Raghavendra.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dfad67f66c0..f1575f1d2d8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26408,7 +26408,7 @@ F:	sound/soc/codecs/tlv320*.*
>  F:	sound/soc/codecs/tpa6130a2.*
>  
>  TEXAS INSTRUMENTS DMA DRIVERS
> -M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
> +M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	dmaengine@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
> -- 
> 2.54.0
> 

Thank you Peter for the years of help in maintaining this. Cheers.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

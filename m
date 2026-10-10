Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6636F8F0;
	Sat, 10 Oct 2026 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627818; cv=fail; b=U4rJz0n6AI5G6auVLrORhtoBGiEgHUi9TK88gai7NCOPi6Hsv5J8FtAJnKIDLl/1zC5Fu+ReOG9xjKIWZkzHwMIPWbwpT9fQ2cJLcJz1zG2zpbVcpE1W5YH2WDLvy5kgYGx/NbMJ1VdxKOjuv6FSkkddRfzBmAbLWBDBC37CkeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627818; c=relaxed/simple;
	bh=b4JSqlf5hgqzCvfs+x4BE5zqpYpkhZCeUOemlT0acAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMFXg6vxVYU6B7YW64abf0Eux3Q12POwEOQ5LAlomv6h8z0akzR171AzuEJzVHu5FJOctPB9SKYLXoEe29cUPyBUQv6l8R+BHZ2uRIgqlM8I9ZmWUgY260jpORUd+tEGm2V6ALSN1xH/x6xmpljzON8KCDuM8IqfMyEE4xNkjn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE4lKpoyFEsezVv+vgVfM5828iy+SCBd1pGVBdMUeogNOzV0zDqMTALuQXdJHYnJwcm1I1KJd2BadkFrFbdsrSZQKpFYDbKyo4YF2XIMKx3GU9+uUP2q7CtRW/3nQ+g+glltuG/VnehO+ABDAxZtYEXbHWKagqraUwF6GaRao8WeZCja1hO0rlzssJiMQI1QACQc1vySbBcgiqnnJDMetiBGWRmJYpR/JS8e/CRfeVfZGY60sKyWZi1vSNpYziXlk5J2j8LHMjvGlgZhO20G7F/uNFgx8HTcIBSbTzspogaZ0GULDsi8IpWrtKNQ2I0u7Mrgk0pMXC/BBLTEuQbyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra3VbxRGul4/Hd5snQVYiJUL80RvbxNJR4QpM1YiBCs=;
 b=jL71p2MsMFHFEw+dUe67yaC78wq+/Pp2Lj7PwALXODgU3Ql7MKf32YcNbOW1ySstvfwZ72FeDe8KjnAG76wiUjUVjECQS+UvcpO2UztGUN4pJPT87ry7mx0ljKV7GI+rW9AYgHXemc/vzGNkJAruJ9ICV/nEKVgJmqlHFHZAdMmu5AfCCQyHyC1VXt8Jw1pirHP6YZZRoH/zFpVeF2DfGDTZwT5TiPwZwYQPDnZS+v1lQEy12NqqYKCkqUqVgJFwqc1ERS4pIvx2sp2uGF+PzAC4hUQzot3ZzYAhMQ1eCd75kDkWJZdTEk8DxP7RwKag+Sd1EbPTvnjAczxQ4kCXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR03CA0012.apcprd03.prod.outlook.com (2603:1096:4:297::12)
 by KL1PR06MB6346.apcprd06.prod.outlook.com (2603:1096:820:ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sat, 10 Oct
 2026 10:23:30 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:297:cafe::1e) by SI3PR03CA0012.outlook.office365.com
 (2603:1096:4:297::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Sat, 10
 Oct 2026 10:23:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 10:23:29 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A8947427E3A0;
	Sat, 10 Oct 2026 18:23:28 +0800 (CST)
Date: Sat, 10 Oct 2026 18:23:27 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <asoSH0CLbi7xmjP8@ubuntu>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
 <20261009-e284e1844269292657604ec7@squawk>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-e284e1844269292657604ec7@squawk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|KL1PR06MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a154ad-727e-448d-8458-08df26b88768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|18002099003|22082099003|10067099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hP3oF3yoazrukKFLyEGJ2QsM2wdv4oRuhzR1ZLX/UKJFJO+AOPosoVPDWdkdChaIoKpQOWlAMDlVzyL/pahMR7z9WXXvkN1JozXr0Be4Z7HCdAIn3qtMP6ElcSTtWALtUbemCS4Cl/mJlquqxF483i8rdBp7TrOQ8oq0mS613rjVAKPMpQ151gxzPGgmtE+qH6FckprQH99HIXYfdq4sSdNSAurgqf3PdGbJnuHw8K3we7CzfVLH+6UWDlw/RPpWWwtKcKCn0AyY2icnbYEiN8KH32h8NrYPN0Z0aCHU3ix/AigdeKDX3FTclGybx6kWxNRWbecvTr3aJuLbIdVn9nIp9khAPP3xy7H8ryVrIKHq3Vu0og6dy28gWJaj2I/Wjmv+7+ujbiE4crqxkylv/ZVAzvrWK4FTJfh3CUxViJalrU/gbxoK7rlSBYCkQTfFCGBYpn/8Ms39F7GtL/WV2mULB+08ZBxrNuTb0Cc/FQGFPhq8hJ9c+6iSDOpQMorHw+Ed61VEv8zQd6L7ORzv5m8hbmfObOgAZKe489sVlYhe5usmJHjsVhY/T4STom48GkdHXqJhX01lvWOtjGS3eqKxJbD+Xonprp3eTGJBWWHorxNjlJ8HpG8qeQf32/XwKoum2Y6Dl+pe2MhYRpZAyRbuvgxhD6FYt5et8BMDiTfi6Tn9JcwQRQe1+qwYQWtNVuZ7gzv/RKqQPiPr0nj0Xg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/m9EHuf8m6T7cwjfzcLozRdWYgzw/ruxBIKj78kX6wjcJbLCct0vBY5BZF7ibE0CryxhDN7nUw0zVZ8PTkjnRA55bmLjndi23Ak2qkZJQ/ZdP4x/7Rbl4SeokT34OVFLCVAptBS1aHyUc0D9yEM8QGUns72yigctYmEpg7fTC4noYOtNTVNu7WniTZLeCmcpmQicDt1i/84aql7OlZLZSRVl8vWz8hRPKxtIwnWJnDGO7pe+Q8Jf0XHi5QwsOgF3h+KOjOju1EfsjjnUUfcN6QowFq2ETTc8Ty1MG7hcc1g5cgdq5nyD0DeG1WZqOxx+pM1nWy00BO18DwpZJG5hr+pKE7UyJwunsoS7SPN2MTOpYnUQUT5hYQgE0mhS8nddg3nLk4+2VZc1NSzJ22+RhuB5Q/APS+HFhh408YT8UIE+n7elzv8pvVeoQZ96q7D7
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:23:29.5833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a154ad-727e-448d-8458-08df26b88768
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6346

On Fri, Oct 09, 2026 at 04:31:26PM +0100, Conor Dooley wrote:
> > +  cix,irq-router:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Syscon phandle for the CIX Sky1 subsystem register block that routes
> > +      DMA-350 channel interrupts to the AP interrupt controller.
>
> See comments on the driver for more on this, but I'm not convinced that
> this should be in this node - especially if this thing controls other
> device's routing too.
>
> Thanks,
> Conor.

Agreed - v3 drops cix,irq-router from the binding completely. We plan
to handle the interrupt gate as firmware/pre-Linux platform setup for
v3, so the DMA node should not describe it. With the property gone, the
CIX-specific conditional in allOf goes away as well, and the binding is
back to the generic controller properties plus the CIX compatible. The
corresponding driver changes are in my reply on the driver patch.

Best regards,
Jelly

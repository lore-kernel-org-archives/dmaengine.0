Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792788449;
	b=RgQuSr0V239HxZn7XOW8zdICL1p/OKXUaI0uag7ucg7+601LjYgxgyXt5uPe78n47pq4
	 uXcOppyXArb1d7czxn3CFD95ggcuJbE+WZmwJS0OKnvFcagxsS0DWdfkhWHT0JK1vd9Qc
	 OVLt6Wnhh68QezbNliVpsDUTe6OqjvJ8tFUPlYehLXQ3sXk2qjX8LRPUtY05lr36es9CF
	 bu5z7eZ9263as6U13ZbF8mLqCelvwx9xnJVgt6hqtmxh4tSc+dT05TOou29OiBHkw6L4U
	 bpne7odxKVoWf5Fp40bdKbTPUgjgHDqMKx2PiXz5/HALMmSnMO7odKDDwitbo2+RrWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788449;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1E6StJb3QI5GrH/jkmYhwLq9knhaxzuBoqobOighR7s=;
	b=QxJIwB5O2y3p866rC0mA9DR6Jj7EE5rk8z3LtPN3UABXXcV4pl9FRqVQ/lamEM+lpeni
	 WeziOsl/sMoxUiBJg0HLOX+Q/fDnCtR0XEvaZ+DhYgOW4U6WA+OvwY9JEfP9bSVdM4J4/
	 1hj+WlkTlAZMXgy8uAYdfsQdExCv/h7Ghh/LENR4Jg/A2De08Vc9TjRO5jR5wka1haCv6
	 B09a4TZS3bap1MJ9V6G99DtgLOaN1xIsGHAZKW9cLhob3fPd1uvZUJt7wfn7pFswnLrNZ
	 q0H6SYbOc3+vHih7TeDt5xEV6ruTrh7qAqAzgheIBVKgUCjaOkuzyDwxX7eLRZLRVqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=euie2p2f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.15
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DD606A327;
	Fri, 23 Oct 2026 20:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 145DD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=euie2p2f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLTPxXn8QpijibFDKCnebsGZui+xvP3kv+IZ6truruHmVqhOAfTCGfth28Dp76e/O6rgpegDdxtTnAepiReUmdCuckse3fF605exqnvxPopRvI035tQQd8N4Ot633zd5NSFdhx5zAAmYNB4EWNeQ/rOrYfILlsmwMFtIKx3Cnc50bt2nGBL3mdpvu7ZuP7oNFrlkLZXu2Uyxb2ADXTJvhmV4olaD1jEjBQRKNMr+mX4g9EcThJEnRKEc2lqgXzrADdLhGnZzSO7zwvgXUBvifOc+bCRn0Tc/JRPUAcsfuyZwFdDLEPryMFeOOSXIcAfD2IBGZw4KedFIlVByb1Qa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E6StJb3QI5GrH/jkmYhwLq9knhaxzuBoqobOighR7s=;
 b=pHhJxmNqPhOalkv4UHVKFfLvUg84/H9gE0rJbzYWFpzyjLoVjswurOa7crNAJ5F1YGmnrnN1XkljTqwyyHeA7UUE7DhMChroq+NfLPLpsrG/VarbYVqRz7aO9xtZy4ePiTSlm/HI1sJuDAFhldHkRvdv4+kERZeyRSUYc3IckccHPziQDtHhdVJOhbhLr7Mg4401JjavZNHIdjUxQaKijLfFBx2EOBwcPp488VrbFOUsTpWqDannUmBMoHLdAsUHkmavPaivaQ5jQ72OHmqcr3nLKrN0yakOOhR4k/D/0QBBKAq7t08L/q5TehPZ/22D9hmciou9dC/oYIl7or4qAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E6StJb3QI5GrH/jkmYhwLq9knhaxzuBoqobOighR7s=;
 b=euie2p2fi+i3MUySm1r0wAT7JAmppj+Ha30/PDyh+iyLtWqAoBTkAYM3J1PYGNQTVaMlA5mqNDHmYolTMUBMqmu5PRDdbzTauepzVx8bCyYU/SOMOpMO+mCv8pfc/cRMTQLdQM+lXI2cS1anQmBHPI7o55WfTZmN/zroe7e4F2wbqFU4Ydnz5rZGL6QxHV2RPUd7ZtDatpI+maQTqHZBriRclRlw0HjQjTgD+MvraxPG3lROQYqGiAJB3AAyz6g+mIUMkjzo+7elH0s75GkuuKHTbHvILle53h88bG2gtLAyZyIqCXk5dLEJba28qDs+2lgqr4PZ4cP4tgzk2EstYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:47:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 20:47:25 +0000
Date: Fri, 23 Oct 2026 16:47:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: amlogic: Fix an error handling path in
 aml_dma_probe()
Message-ID: <atvH1ZOrSbsGwncP@lizhi-Precision-Tower-5810>
References: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: PH7P220CA0138.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8301009c-9cd7-4a03-6a14-08df3146d7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|11063799006|56012099006|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	aAknh90ufKKzYRbWapKSuJO8pphu8xhMtapHD0f/EKpxeKD7AImMqzdXaBTU1W0FbYoByXsLo7WFIKY4UxTDn+YrntjQsckgYlpKXAX1dWO5Z/thDaplfX9HYLdpDNfwAlCT7Njej9zRYmWIwB2Nt7YlyEgwnpjr8AxbX1ksk6Gx2iVxIMBpuoGOzcsMKofxfTmyby2cwk2s63IeJnw9Gwn43sOmSi8ANeNz5dfrkUhfq/7XVre7OPUIutt3YAAs3dFOc5z0zeERy+UD9nqu84q51WXtynEo0Gv7F0KO6czJ7KLKn8leSFx+ex80hoGca5WgfOvd6vaycWc9v+VOAkWkw2yhf+vIrFAWnFZuqHOJTVmjFGcQC/dyDYgqykOV5OSWfw+cTjnrrSYa95Pa1su6RuYa/S6W+XV/1Rw39i4NSIMNeAB0M+Q7e+b5GYgQ/hfPfrtBINZnH1ge1C52NPkTpc+OgSMzb4WHVbP3tRK0DF5AtzecK8KGp73NeRvUggtO4Jxodn13kRyXRTLlkC4Lm2n5dSs39nxrmw0jPpTfgp2VIYd5SpRqqe5LSvJX44/UKFEPofYxyxc99leNDALmbtbUo+eaVEaZHCrUAAhLtnMhw0gKtp1oYGAx6fFeCwOy7Z4pNX0g6HSaPrzVlTsZZHvXRrqnK65avjDStLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOmSerBt52cZwDAxpT6x8LRjEK0IakXIDU/hHnLW6lyny4fREEJ+lwyoLxva?=
 =?us-ascii?Q?ENt0p7QON1qo9PVcyj8RaCnwgFexkPpekoMaveP5CnMUJrNbfrZ+n21KFIin?=
 =?us-ascii?Q?inmFTPLGPv4au9vmIU12dG0/pZ7A6kefBg894I4NKMe83EBuqkjHLbH1Hxal?=
 =?us-ascii?Q?4alOZ49iws+HpwA1wZr6NpiFE7WFkY5zU0YwpIo75iXMXOuEfe0OXuUHOG91?=
 =?us-ascii?Q?fIVGLuddTj7SYhLJSgUzaP/F8ydgng6c74JUfN9pNPXrApEB+DKrySCahFkj?=
 =?us-ascii?Q?xkBsEbPv/BhNlthHE+9hUytsz4H7RYX6EmQHD1e3uI2giicUa4ds7Y0v/fy0?=
 =?us-ascii?Q?5pD9sSE/82v9AxL8jmEnEaq0Werxdy7/Wq4PpbxAGiDG2mokSKYOpLUywxZH?=
 =?us-ascii?Q?INhtbBqTM+6Zs1BnSHMRz9nARSbJyRzNdYaJGvI8pNBQzhkrB2tglnDN628x?=
 =?us-ascii?Q?UtKrNnpX+bp2BuY2h+RZyMIXKssRY9ykcwIJMqY5iJ9MhDi567N1X4k981TW?=
 =?us-ascii?Q?tMhUSlNWuno4Qt2pAM2IEBz6ZfBvwf3OrttU4uIuRA3Knfd18UG32BRh6ym9?=
 =?us-ascii?Q?5//kE77dlrbGojUtmbWgBGpHEl32tgFyP1LzY1k+S1dFb+iRIPyeBOBfr7J+?=
 =?us-ascii?Q?ZM89XVFwRw0mYjVIFtB8/H8N9qbtgMEJxtPlv9/cs5ZHpV2bYQg0MmtzVzPu?=
 =?us-ascii?Q?vQSsMGRcco5AO7rkzH4ceZR2kWvdT4J12dfds1lMktnovKUjxRDTjPOa5fhv?=
 =?us-ascii?Q?sYPT6v4/5AJe/bIz04opoNbHSmUYieE3kfJo0VEVg3XF8rE/Qwx9cBcfNsxO?=
 =?us-ascii?Q?aE6UjBoyjU4Wsx4ynEvom1LPi+CtQrxUM9SXyyKIW93eHflS8QMhXk9Zdmt1?=
 =?us-ascii?Q?RAHYlzQppv7pD8egQtn+UMG25pILgElP23W5oV45x0UYSS7YMe4xgfG1V+ov?=
 =?us-ascii?Q?KN5uA3IjJCkk0GOomp+6UCjIds91F8hoikz96TNSUJdIOoBEmwE/wLaDeMcm?=
 =?us-ascii?Q?Dqf9L47nDeUMoJsH0kUKB4RjG065KlX/pL9W+HiTw8i9NYDCQGm+De6u0Ioh?=
 =?us-ascii?Q?AiqJj6tcEQ0F2JNVOWgqGa3SRydiXMquRs1LyyadflZKLpxzw2EcN/F1SetF?=
 =?us-ascii?Q?f3Ux84ZkDcQPFP1+7j6oOTsiWyf0AerZ71b9tY5zE6f9JfG6z5tYaDZ3dtHY?=
 =?us-ascii?Q?KOzYlAAjYkBrwsyKRo8GWiEZWQtQwQ4mC3VXVsXfXDl0NfgUluVRjVFWEDDh?=
 =?us-ascii?Q?LDuv8XlP9zz5483pT0iUgXVea6WbtrPblNLMr008ifFGXWDdRTYOjK7OQuMN?=
 =?us-ascii?Q?B/4ixVMCZMC4wuyZ+vBzScj3aGv6jo/2uCsCsgUpjMMUi9JxDEFS56BDHHEQ?=
 =?us-ascii?Q?6UeYHAEVG4xkBZaChNaqs2euNNHFa4UfsShnTmh469HbxW8Vy41wnWjLr8Ca?=
 =?us-ascii?Q?8IouPxS9/9CN28eNbys8JK8mB/1+00A0nZ56fVW3qz+s7mx1Zr0oxIktxuNd?=
 =?us-ascii?Q?iVGrXHoinTo/chzpDst14jQWKzoSEVJRfMKkluQLSUD9YidO714Oj0eNPlDd?=
 =?us-ascii?Q?dCoXUOt0hNOYvt29KfOhbhTQ7xOyzfy/eFL/B/E+JfwCp+FLEZFqqlgzpTYc?=
 =?us-ascii?Q?x/D1qh6AAt2phQqUPAieRpkZJNdILN/CO7ArNTR3g21y3tZNrleCdN22OVP+?=
 =?us-ascii?Q?tXNIS75Umiu/LlTbv0Zcaaz6G5BYFGLDPX9q2EIFB9jc2llExYNcSW34WkSQ?=
 =?us-ascii?Q?rqWOuX6vOJ8lhYVBi7qODEdKDDvPueSPAgRwwpmPCfFzew9/d25o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8301009c-9cd7-4a03-6a14-08df3146d7e5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:47:25.0269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9yrcxyO86ks1Lq9XhF0gvC3TsNVfaKc7BN8IGuTlXyl0JNraUGAugawMBHN8/j1qA3nInhFt0+GjmRM3ReSVEY0OUCzVumUoawHG4TOvpYN3XdBsBzEvFUNA3SkSGXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484

On Fri, Oct 23, 2026 at 09:52:50PM +0200, Christophe JAILLET wrote:

subject:

dmaengine: amlogic: fix missing destroy_workqueue() at error path in aml_dma_probe()

Frank

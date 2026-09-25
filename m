Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3F277CAD;
	Fri, 25 Sep 2026 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300745; cv=fail; b=Iu5W8ACnnBB4qwcnuTeSEpVFB9qE9p0G4/O9WC3qsqLiLmvBC112jUtgKfZWp9EwNwrS79WNeNkvldX4cAAYOpOK7NHYML+0Bt+qMJVkXUNHtF1lhlWeJRTUyMA7hoSiG0KSY+QrYJ7J+TqLwaTWSwgH9KIV4zvlDWTuNQ9bCK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300745; c=relaxed/simple;
	bh=uXyacWaDbwYfCa4zm0qagh2xhFBo5WDir24/sv4aqYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ppQUhSEm7+vYpn04z3enYPHCJjbDEBWBPRwb0MNIwkHg03mpb1HiNwA01vAumKL7BxniNXXS8RWynOk5GFR2qjPFZ/rlpz5baMafPRld9H0bHt3WILje5V/X2oxTxJxrcQktW4S++APvNbv10p3agw+tJpNEp7S837YAwq2tv2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DxNUwrA5; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DxNUwrA5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icJUeBIAoLeVW6eLqn1l4DXmsPO8CKP2HJHxOQOP89qffrhdBEa3tFfNLOixgr+Iwt5JtWTmsmUfuDl3ZkYURUheUMVfhwVTiMeSjDDKpECmYiz3U6DUjp2yplUh7s2jBqrdiEkz9FNg5XB6rcz6b37bEQWgUEy25FHxGpj9YqKAU0v+z8aHwTkLPZH3Hc+KszceIJVo8N9MMeZQQELnthbgOsHUEjLq7EEW7baa2izPYglnI484ZG5m7mRGxVsCHQzKMVGCmCJ8HCZo51AXxWLk63TDvdFRRq5LEzDzRDKiDlkn3Rwby8wb7wPHT+bf9KW3BUZ318qxWuwmZdPBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVYtiwIImpTqQcxL0EFAlX3PrL6asC8HffEUuzPxSDQ=;
 b=VkjJjV+50zyFrWtfvFq65uGcH3dAUR8a2nqWV2RDsEy5gL515DCzN6j23/UU91fcY3i3RUUc926g5JRiEzJxH+GDoKMqD3Hoz2nTUhF82UH1uixbFq30MruwWUYLDE2y6/aPyRIQJUYcGxUuYQvCwtg+X3tFrnK1WOZW1I6st4F23J+7OEM82Uh4zNAUs6KqudY+9SVWNYZ9blteJI+o6xDrSlqJCauPExdqDXET4g6S8IH1pOWwOLW5q4o2FLZqWj9Bd6BNQVgTZhdebWUbvrGd6BIuHCkajRSRalvA2QfZaxXQoaiS6IW/KKE0r6y9JGa4IbIyhvKC56K12o5ipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVYtiwIImpTqQcxL0EFAlX3PrL6asC8HffEUuzPxSDQ=;
 b=DxNUwrA5MIwqJHtxAJvKBcCSvImdoCEICiQqIXmhbJL0i1mOVhT9FVpb44RtLGxAGa7eGAfQzAm1KDkbLkK+ad1nfm24VurLxFw+Vwwc7X3pgEgUSTX+s8BQQkjRm/lIMCbQztGrV0owvmddD4hTzbHdAlFO1G5UoAGxdwroiW8Id/xAjQdW0iVXzNr3miWzIUA4cTRL2urmTeEBWK6YrYNMPGZZ8EALTnVqEwnbWlperLbJictUwHzXCWkD2dz2lWQMDQaCLdjk/hJchslMBi/S3754i4UbzF/8flVpVNPW5WiOL4ap1Q5M/5GGds2EnbVeiOPh7LflEVevMB2ELA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 01:45:39 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 01:45:36 +0000
Date: Fri, 25 Sep 2026 09:43:10 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: dma: fsl,edma: add iommu-map property
Message-ID: <arXRrvyFxMc1I8ff@nxa18884-linux-1.ap.freescale.net>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
 <20260916-edma-iommu-v1-1-e1731968081e@nxp.com>
 <179028698602.1895482.8450136905176032994.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179028698602.1895482.8450136905176032994.robh@kernel.org>
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d6278c-cb6d-4ff0-566a-08df1aa6b242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|10067099003|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aDvaUdVNdwrcw/2N0gOjiPqFtl2Q7P5onTRZ/8aGCWTwEkvmYAaSHxMk9irqj3Oc7/JoBfsRHegkXJsJScA7+qtJge16o7JijLQsdfkHNKyRDOnvUHRJR0IcxSQROUAXOQ3UAkbblGtuG5EqdPoBfTShG3OVloqOQvEdJ6A8zA0MgCiMSGXMuna+YUg/DADXX7hHcWb94PYOFRx10t92ADV25y1Wujhp4vzr9vcSoex2Wsffx7V0EivDTpnzK0oK3VQjHJMR+rXhinOcI7i5ugWJKSrhFexjD/rkMThnwPUM9R76E3iOeHSXenl0qyfnr4NyQb0QDFPwlLLPvzxJMVxVJ/SZF+5bTF0AC3EHwUCdQigfhXKZY9GRg94XqoJlFC1i71V/QI9GJx8/+8wOEtnBtl69x+5BfPR1RyOhPgAmwLhFKdg7p4VTa+IWW7U75O/KX+9TO71Pxp6HSaOswoyqLzD8VhD9MujA8EaXC5x8Kc1g68S3lEYy7L0aFll+GfrUOq1Hc21uLMSsjmmaidFzv51dt/1oVD3POoF8Pype5zI/8CE5ryz+U/7qxoiBRY85vAS+cy92senU1yhte6//XBo09ylog9wVWp/QbLK+wgLWLYRx+O+br3zDP0ZU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xnx7tEqxXZCdgmLhyvU8OX5l1HA++DRfXIlnryaHXL8OECr4qCe2pvq89cJe?=
 =?us-ascii?Q?BcO7MUeHBtKRusL6cpWTxWQJVVvze8W9Y6B3PzSaEO3uYC85u3BxJ5Z38EL4?=
 =?us-ascii?Q?dtcL2SOjnJWLyimMUW8hEkb2HYpxlwDzltEuKht9f+/0b96qxdd/Dolscjgv?=
 =?us-ascii?Q?AzgJG3VPGHj1OM0flHggVm+HLjXl8wMPympQG7sIpiuP84oujM+e29FKuryo?=
 =?us-ascii?Q?bdQJM5sh0AYQjljXguVvWBA6vMCP2OupOZ7MUGMQopyaETNRJeIvx2ns0iZu?=
 =?us-ascii?Q?u4enMhm6C5sb6ctWa3vLUVs7PBd7bWPpJamp4aVYcw9gLXesM0DNZNRD2lsb?=
 =?us-ascii?Q?tHTx4OaAT4DOgxMYt3mM1bmfWm288PfuGj9agSKNVjKjLtSzfBPU1/DHgFwP?=
 =?us-ascii?Q?KqhTS4nRL/yjvBSXN5529uzhw+93KwNUKDfJBdc3F8YSFt4P/TZ7Qn+2f2/O?=
 =?us-ascii?Q?YM4K36A4ZUy1RwS4hv212eCh0zTkmw2ORfC7In0Gjwite0yaJbH8Y8fBCeJs?=
 =?us-ascii?Q?0UHv3tVXidEWR80XywKs/EglfAVrGXkgnUqCzd/5CJpoEEg+GbVJD+KIXYpK?=
 =?us-ascii?Q?3CMZKQiDDaVfvpcDIJbY6U12UIBtcBjhPmUXA3lf+73V0LkdqwvzNaSiJstX?=
 =?us-ascii?Q?KNuSRvpUQr8vw0Y6MLwdL/Vr4sKuV9g5ns3Sxlvzi7GSpKlxdUoG7REMjZ/N?=
 =?us-ascii?Q?FMbzO559NaRhRqXD8aHsqx9ZLf7GBxeL4RiTQHAp9h2+/LBVWYhJ+m63lev2?=
 =?us-ascii?Q?Ra5VByZ3EEKuUSEmytKtvyerHJHlaL/6u3eNx62PdjYg1+PfJ0cWwBZ6Fu4L?=
 =?us-ascii?Q?H7gDfe4RAuZEc9yVCoBu259KgtrbJ+oq2Mn3Q80SgxipyqaoNEWrJKwBnl0G?=
 =?us-ascii?Q?+7WggFYxKI65c1v5M25cFk+VSr1Qgq7CLXrsLuaHrPMvKvDpukGF9nhGeZeb?=
 =?us-ascii?Q?PyHfpr/okinwalp8RCHzP7tKVMCcXlt9Gv5J207IZr3PO6AXlArWfC4gXy5P?=
 =?us-ascii?Q?pPRx2eYqvCWr6H5vRSxx9i5wt/eLItpRDaCk+Z4xBeVA4mFu1NqLDkYLHGO2?=
 =?us-ascii?Q?QUiNWkyDwKyi15otKfSlxw3JvH0lywTBWCSDP8X83S+2Rw3qPZToFaJnjpp0?=
 =?us-ascii?Q?wLtDWrZESX8KrxbgG0frHRBx4rfgYY5xwqpNJeFvSoSnMCFF3pSNB+M//g0j?=
 =?us-ascii?Q?ULT08aJGv3E6L3UgrF8B6jApPR78ve1oizKhhkmzl3DaAVTp6BpPUZEzrpkv?=
 =?us-ascii?Q?sELPFJwlAqQPU0gSDkJxfX4byKPLyo7sDwSVddtrCa0y2MGs7fUf8HGYRwku?=
 =?us-ascii?Q?ZDjQ6bKHo/kVDmzf7IU43/ZbAq2nkSYqNcGzyjX3NVw0nHYJsIg3kyCgO1ls?=
 =?us-ascii?Q?0lmu9ZdfbFEOTWoaF/f1Ejeb4b3derTj9h0jSsJGbguPLKReFstbedxm+9en?=
 =?us-ascii?Q?0uRH1oiqoO+qAxfFxuaVFNsZNI0LbtwLYhP9Y7h/sjUgUgf/5QJaLkMcRX2J?=
 =?us-ascii?Q?oaeUG/hLfHW2KXzmDSbUYqy1CzdOBrv12pG+C3l7HpdwJpOWrCOwXJTUodTD?=
 =?us-ascii?Q?3i75d4byhjNgn1OPi+IjlZINNS+tfVGIExrHtgUWoH2W7DvQUP/fas+qvAjA?=
 =?us-ascii?Q?sq3JFo1Cp38KFzVMIhuMtQ16So7LW3YxhH8QKspgMhZ+lhOoA0kSfpcpuu3L?=
 =?us-ascii?Q?GtG+V+Q6D+oq6AOoiUl1XP1WkCSjK1TuZbTqAv5Ao/Ezjubh3ZrIYoB5/9Sv?=
 =?us-ascii?Q?u7wynH8tF0FKd9CZUeu5KFhblVWRo02Dal9jYzUif2mVMdpehjlk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d6278c-cb6d-4ff0-566a-08df1aa6b242
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 01:45:36.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNRyDzZA2BknMYGvlbKoxCNcTsGat3y2d9su1zS19HnnjCHePUkEsfz4mF8EsJkrmPvy8NC7K9FdnQrMk6bYZPmCFOP+OYBRz4rmNxbi3tNG3UsR9u0UJjiI7Xnq/V2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646

Hi Rob, Frank,

On Thu, Sep 24, 2026 at 04:56:26PM -0500, Rob Herring (Arm) wrote:
>
>On Wed, 16 Sep 2026 23:55:25 +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add the iommu-map property to the fsl,edma binding to allow per-channel
>> IOMMU stream ID mapping. This enables IOMMU translation for individual
>> eDMA channels, where paired channels can share the same stream ID and
>> channels without an entry operate in bypass mode.
>> 
>> Also add a new example using fsl,imx95-edma5 that demonstrates the
>> iommu-map usage with per-channel mappings.
>> 
>> Assisted-by: Claude:claude-opus-4-6
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../devicetree/bindings/dma/fsl,edma.yaml          | 89 ++++++++++++++++++++++
>>  1 file changed, 89 insertions(+)
>> 
>
>Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for reviewing this patchset. I think I need to drop this patchset
and use the other method.

in https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/,
Jason Gunthorpe does not agree to use iommu-map for eDMA channels.

"The DT modeling for devices that have multiple stream-IDs is to list
them all in iommus list."

More comments about QCOM VPU in
https://lore.kernel.org/linux-iommu/20260618151745.GD231643@ziepe.ca/
"
In Linux if you use DT iommus the SW sets things up so every stream
shares the same translation. If your driver/device doesn't like that
there is no SW way to opt out of sharing. I think that is the first
core issue that VPU was struggling with.

If you have one "device" then I would argue the DT should describe all
its streams using iommus in the normal way. The introduction of
iommu-map for VPU is only being done because that is a convenient hack
to allow Linux to unbundle the streams. It would be much harder to
unbunble the streams directly from the DT iommus property, but that
would probably be the cleanest, software agnostic, DT modeling.

So, if we are going to do a hack in DT to accomodate Linux, I argue to
choose explicit child devices so VPU does not need to create a special
bus, call of_dma_configue, or hack in new DMA API things that only it
will ever use. Then the explicit children can properly describe how
the HW decodes IOVA into each streams in the DT (which sounds very
much like a HW property to me) so that Linux produces IOVA that the HW
mangling properly routes to the expected stream.

Then the VPU driver just has to assemble itself from many struct
devices, which I admit is also a troublesome task.
"

Thanks
Peng
>
>

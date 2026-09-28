Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348ED4854F1;
	Mon, 28 Sep 2026 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584873; cv=fail; b=lU0K8xZT28xz0CbgN/w3qgGD7yZaPopwsw9bbTYdjddbmuZogGdWbMhRp/eRt6/ApAeM66LJ74FVhit4l/FsZxAFbFrostK/woVaF25e2sYB9KoypBqlNIwa1q9xFsmkf4D0+rISoj9kV1YTigkllLbdOdKPlzXEJEaAXOYflbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584873; c=relaxed/simple;
	bh=pK/YhMOxx5owwP1VpPkJQy6SOwUX1ZRP6ThYo1JaJ3k=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=dWISIHWCpe9HurPjG75srgUa281Cj4IeFwgtqCrqVbjQBUIP0e8lLisTGnb+C7vD1Tom0nAX3Lo2eFWNqLfE/R4ujmk7S4skBrFSWB5kiYBWdr5tDAHDV98kV53E9ZQ571U2Q2h1pWiRG0h0axxLcRHCDihv1eQW9/rjuSeeUMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DnjsUmWG; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZMARouXk; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DnjsUmWG";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZMARouXk"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80fjl1469579;
	Mon, 28 Sep 2026 03:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ObdVyt7SmjUr4mpFy2vXX3EcWNeguZUPlQnpLZCPG
	f0=; b=DnjsUmWGgXkcQ0vSqVtzpLlv3v0JnHMre1/nLC/sxjNHYhPPG1BKPYlfV
	64KdfV3MOchHbyIbdJEe76p93lAvWVo9Ee05bNa0kYzVHdd9qtnwLCf4dHjZ4FNt
	gROMtNi0E1kHLG2165sTMhBXZ7Vl1RkjqXj43uN7xXQLFHJ6EIkNp96af2fMCbDN
	eD/Jys0aTlnQnY4VOUT/Z7dLLU16R/u4p9/P2O33uu6wTGfjwVm6yYGJM/r4VN6D
	89dn8T2bM3dBsGs1+ligqWGnrtWPBse9lHzwzp/u47cmx/9U8sHxDJ3c4egClszG
	2qDI40jx04aoMXDyf8BZhaxWdJoGg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5mxkk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VE6+dZszz05C7Pwae1kmtc28kFYaigPCOLb5AU9BRiUjicUmodCcXBMhCn0zyKcg4JCI6rNVvxNwqyi4C/AmzlNA733Ehk9AT8FwKuEUWcqMffU0aNZPiANABjE1ljZhKD2MOCiBOBoQKexqrKX/P5/HxvrDQswtob8maKfmTf6O9a/uOwixUpvJdzLjDj+7OUsfx9CdLd8GFNsEOhoZ0mYxPRmVM0snwC84aRjzq6aqDtA47ia87oGyKokT2Uz9KzFIPjWiekERuYnd0232oWZvfiivZN8cJC4youR0/77XZFNu+khqyhvbGrm5mH4KOvG+HZqFquaX6PHcQWHK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObdVyt7SmjUr4mpFy2vXX3EcWNeguZUPlQnpLZCPGf0=;
 b=oVLFnoTS1NYD/WRektExgVF2kCGwutKz1ocjB9Oy4PqTT6U5cQOxK0bqFyHdoIw2wQ9eW3+I6xUiWgEX3c9SysI+lWxmYZV5rd8p2KQ57ugHeElCAW8tVsI9FvmOeDEtYZb+zFstvvIHwYp9hq+/eoOBCx+3uaXw/v3zjzXsyCjj1+Qv5PYBjM52j8X/m5AAgteDwoTHCNfm7bvMyQRrduZRDH6fdhxwLty17LAdnsLyEbtHFcLUkOMyvDjsiB2WAO0/J1nrcCRYZSBwXg3nGWrbYFvk66HdkDyOYE+wh8Keysg0p7CWneBsIZwwm4/Ac0m1O9gpJK0ZDpu6k7CLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObdVyt7SmjUr4mpFy2vXX3EcWNeguZUPlQnpLZCPGf0=;
 b=ZMARouXkYdFvU7PP+WJOyTU8vxfJenn2SCPzCSDQ3wwsd3X+pCD+qHEak84Hh8pVEZhzy2iUTYYh5b4u4McWNz9P1t1L5lNS+FgV4B39d94Hz23WRYrKyE8ufdUAPN1cmzxTHepdFz6aAymodkDHoaqjRv0igTL5o4M92wY4ay4=
Received: from BN9PR03CA0393.namprd03.prod.outlook.com (2603:10b6:408:111::8)
 by DS0PR10MB998125.namprd10.prod.outlook.com (2603:10b6:8:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Mon, 28 Sep
 2026 08:40:56 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::11) by BN9PR03CA0393.outlook.office365.com
 (2603:10b6:408:111::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:40:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:54 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:27 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:40:26 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedm3686893;
	Mon, 28 Sep 2026 03:40:22 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 19/19] dmaengine: ti: k3-udma: Validate resource ID
 and fix logging in reservation
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-20-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-20-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477465.77164.12515616676140386605.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DS0PR10MB998125:EE_
X-MS-Office365-Filtering-Correlation-Id: c02fad8d-6795-41cc-504f-08df1d3c35d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tZANvD0fKs3O8wbgz1Gl/ywVOONfTAACILciXXfc4YG1jcxjhAcb6eZ257cTIy/eoAUgkLH7sgIJx1spa4UEsE9BC1e3e/CGwyOIk2QrzGk+7ud0nBcPe0AABc2CaVOFTpIFGxzYoKuF8PxAx9gWH/gvIX8ibKcc/VI4nX4FmUD/1MyeIaUGwmgvSpaJ74J1Gs6X2/qh4L5y250GdMUPGm3MoIvrP59t288yhkEdXedMsT0fIWwn+QizgS9pSNg3ICAA2V/ttELueQ1OGR39bEHwz26MI1agS7R1qSrVeDpfXEbB9hWGV/HgGbSTFgwhqLYdgq00U1JnjgrjMYwGD7ZwFk5fjBm7AMEPMjzf7XPUXO2ygDSBhLpchIXSti5Hqt+ruUQpjdB0zg0SLdIeFx021EjbQDK9JBVjywobOHYPzKf+K4R3qwTCLTHXU7VwUVVuY6Kz5MDyEMEPhpIhquWxYkoZYnelPu99r9bGsxRt6hl+hDtuoKi4P3TjQBU+w2OamOtyFOO+nc+5AoiCCFe4lbjJHRxshknxXGYQkSaVv3qkEeqdzBdJ61yELOzLntdXdjwVw4LHtZznuqgkhA75JbFHE/7WnuDKFnWmUJ9IesXxeCop3Ur8WtjDdH+2nV86caTF1cZ8IzaQk9wuiuYOmHIwf37Yu8fgtSWPkfYPvpBuk0+zjPVCMvSR+rKCn4kICqHBekAAxgJbBupk5A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PmWzBdp63Ix7K19xueJ0jjXdNgloMyzZFmWm6YPiqgL4WnJDYxyuFrrXmDPxXW8C1Piu6u1vmqYpPnxSy2fySlE1/blF2xdAT5Q0gn+QC3qHbcGSs+tl0XWtld3WMluJ9h+FWyZNiQOsX4vw1olOFXlA1CVBAOZSlHQcVgA1fege4q3YzLw7iEKiBKcYzRGvOHvcRCW+sNY9Ouv4G/OZLiJ7aIdEhkErbq6ltAX1FLCOdaEKa4WOUJYDTp9q8DDI6liUnqNazj97zKmOYlbOHo7+a4XRS2McrW1IEiDyGrIOLsjpM1Bt66hdxMvuICiZ3GM0dNiDyd8vkgL81lHBWJXtXXzWpbrgEEOKKfZxgrij3YkU7n+s2ZnN/he2IpyFQXlJ2SAV+qy05EaLKIINwxKTikH7z4IR/cqWX21SBHXWgWuiWfUrGgeu81YgvbEB
X-Exchange-RoutingPolicyChecked:
	JrKnX3lRzyqQWvhq7IqkAfkQEVy5Hc7zvgD2OeCyUt2kmIztZ/FthPxCiGZZT0tS225NOSlM24tkexS8Z3B8p/qWHAsW/ZSg6e0gwp7eklDbn4vA9b4jCu84X2rR2xXO8vFUBV/LUPapl+zUJlYy3GBg1MvXTuEpmbHPz+nzCQmDOpJjRktBfGUU+7jnKAcM7GjdrSCGqkZJqPD6DnblA1VgNl6hlnDf+XGafWc8EuiskRnFLjEOCnCNITffas96Xf2GVSWb+uFwhZvOCcw35V6s8Ps17xlXEZ+RnBE0Ol+YVD2w4A7nwV3cAh3IBy4YkoTQxxpwkGBHg/6/U33z1A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:54.7197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02fad8d-6795-41cc-504f-08df1d3c35d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB998125
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6aba281b cx=c_pps
 a=FTqHLmxhk7TnHmysD/QBZQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=o6M-dSBTeF4jjqSZ5HwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX8O7rpEaV75Yf
 c3lp2nk1JYZww8+VHrRnVJgpF8Bm+3Oek/9vwSeTVezUsYf4j7IP1T7mX+Z98RE+ZGnzot+VIbw
 TSq50XqqppIjPyHDp6Z+OMeGFEvLrGRuHUSdXI888ecdt/0bHmg0UowDfXsVYuzU28DpeR1j4dJ
 AYbwfaGdYVw0i7gzeWxZNFcxtkQ6eZgvbeFSKAhPF3nBhOlZJuGnWGOXAOptbaHZPrG2W8CMwvv
 hXXBvP5alWvywTRUo67FzuItqR9yzllY5g0VexNoHyDU8I1YQwoWTliypYtu604JLrwPmCvDqy/
 YVq+bpsErs+nHlLOIcA/l9qHg6dnMpF/zjfp2hMbxdXyCoAKUvP814QYmhUd7X8W7zOor4AFZbd
 hKr05aBCj+muzkuoPinKFZnza4hNpDLBk5KH/CB63hItYxoyntz3B95e1uO1M3qx2OR6Hek3Kle
 ARSFJuoRqYTAusP/5Lw==
X-Proofpoint-ORIG-GUID: KrkoFdTf3khHXEN1f9Pq4wbY8Dunbl62
X-Proofpoint-GUID: KrkoFdTf3khHXEN1f9Pq4wbY8Dunbl62
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX4qhwBRLinbfm
 P+sOEnsg5Zh/uueaOvALWjppQQyz1kn/JFCCUUuQXZh+11L2TaPtbNbql8xoAgWOuWe2vXCyFpW
 W1sedtCuWTWv9/8uHSEt4e9PTsS1Tb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

On Mon, 28 Sep 2026 08:26:25 +0530, Sai Sree Kartheek Adivi <s-adivi@ti.com> wrote:
> The `__udma_reserve_##res` macro currently lacks a bounds check for
> the provided `id`. If a caller passes an ID exceeding the resource
> count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
> memory access on the bitmap.
> 
> Additionally, the macro returns `-ENOENT` when a resource is already
> in use, which is semantically incorrect. The logging logic is also
> broken, printing the literal "res##<id>" instead of the resource
> name.
> 
> [...]

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Vignesh


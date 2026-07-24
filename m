Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BDC427F85;
	Fri, 24 Jul 2026 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888514; cv=fail; b=OzKNsEVl9JAYIEqEqZP/t1qlAiNCsO+1rIcDMwOM5o77z9NwgE4IAjwMThkT382qJ2bYm9NC42JimWfFe6Hn/3roVgsyHhoU000Fx39A3FUCz/RYQHKmLnaML5KIFfFF0MX3f8siot3nGSTMAqK0TYuL3Bw0dmsAvyAea/N5JZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888514; c=relaxed/simple;
	bh=CLWs30bM4rdb9SptEfdnX07cQImLdMRoX+quREV4Vv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JpNHZ/zaPhYMgbzqCfY7Qr32B0VkQgYZqtG4TJTZgOYpXvdBfJiY1b6F6r3JAQAXwb6GyUedoa/T1qVAh9asiOt7sqMp0R2d5KUu3imfTAPVu4kCjX0sdBFgepXaX1F1m+KaV5zzp3ZfI2hJPRPenyLqQbsJ1RpHDlXWOLmLeOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WuW6+uc2; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KQy/Plpt; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WuW6+uc2";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KQy/Plpt"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAF8KI2796751;
	Fri, 24 Jul 2026 05:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EPWDEmvEVzUQf5oEGlvVWe6wtqyk8cbFBWHDBECuw
	LI=; b=WuW6+uc2OOx5Mj9l2v67Pj503h7CjTK9uY7b4IeaGahaesJQoVhUK0lDi
	3rC9bbFaGSnm5+fJ49VCkkZBkOfnHx732qpJK5kdP40zMrHxIps/JSLenLufl+Lh
	1cbGMt7xbMOR0/pXwVAUaL+eTKNgIdeeyOFWneje32NV1CL1iMcNtOfnAOwet/RO
	LQdjz6qbgwfkblG7wks89AurJJ3ZW9rPglpwpxBR14D4lRmwZUgWAzR+jMwBY/Dx
	KoOzQ4z2vHmW7k3eqVG9ZvL2EepOaA18t2A9lOroGuEniCAbZDckaqQWY6hRxqvB
	RP3SIE9pkT/RW3T0pDk4RB0zozOxw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fm3v38psn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:21:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyUGNUg7sBa6UPLJx7RvUJRGkQK1uTf63u7x2TtgwHO1s5Nz00OS9SH0HUk1pVsNATZt6hOLcoLxiTxTnQN1xQ2caH3d+xpjCym4KfeMiJxlXVYSSstlvmrDPCxCCBF7sjUVhjocx8cBsp7+48Erx2LsNywTHsqihdyMMcqwuEbIUEuYNasfwsUHtj7B/AxL8OBxAyfAlprKlQjboC4iQCReOIBjzwGqD0h4JE12hDVDdnzEWzL2FVq7lmVw1bQT5fuLULkezlkHhK0V27WoegxZ5oN/pTHy8mKJi3NHWo1I6AMDD+4X04fvJGR6qKghJ0Te/UOr05+L5H1SSlAkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPWDEmvEVzUQf5oEGlvVWe6wtqyk8cbFBWHDBECuwLI=;
 b=hJ6BPON/v6YD6nqb2MFOKt7j28JRR8Y4DH+bX4cjm14Mw3PBWmuSRFWzr5yh0hoa4/qTIIkcMrO8b5gIvRGfk6A59ete8eIkr5cSjEF1mm7+LiB5zzsb59ZiVQZUrg9adBvg6Xyf/ud7SHyrMpCHn+J+NzwwqoZQCYGEtp/el1dbbHPiT8e7PKEkd+/yaMIB0rEexepgd1i7V6GO4sj6RyqMdjJC7tNyCmUjg4iT58NIlYjJdamlhAZ9KyYwF43pVYCv0iiY6evO8SRhvbp3wMM85r7avuhmj17KK3X57rlb9dT2o/S6G7xoUTjFZhcKPYCcv5hirASidRS9V00/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPWDEmvEVzUQf5oEGlvVWe6wtqyk8cbFBWHDBECuwLI=;
 b=KQy/Plpt9558tzd9u4PMz9Ey8tQahlwiHgjEBZhQejgOGMG7Sb+ugVHC2ZBUApaqmhqqZIbIw40NKPn0cj0xpMEoYuif261KWYn9M2Jj63qNzc1QIOAvgZ7EhrVhrcEQSYmOpK5/dp6Dp815JAs2PK8YYzbnuIKBkmuGExGnU5s=
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:21:35 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::8f) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 10:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:21:33 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:32 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:21:32 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFG3017088;
	Fri, 24 Jul 2026 05:21:28 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
Date: Fri, 24 Jul 2026 15:50:34 +0530
Message-ID: <20260724102115.2854-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc9db1a-6c62-4447-0640-08dee96d55eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	RUtR+Yb8vK8Xfr9mbNHbdVnXcFOO2ZV0e/wTEOyi7cyiPsJHNzO9ptR5in3muLw1IMucytGHORLIEyp1zqpxL6iQEWoBVqfhK68fGtEhb7TuGfqtpNJhw2IPQ7fAzeqt7FYLstH1+juAi4vs8D0sp06vYfRxfH5EiO7RJh3aTYmPo/tBFEkXA5U2d2+Vup5H8qub8Q7ufs3LymBnn0mwyE+AjyJz6DwH01cf7qoGPpWhouqDcrwep7LzW+JmirOoWoBosIDNP3teLmit1ZMOjEi9XcvJZHUg7KgndVaIFKqmj9JN5E7zmnObQ51R4NcZYPvjICpUb3sRcgVJFmcCvkV6xh3JxIEwFMvAZStQpYdN7bNxJwTzaXt015CdoFmEsUhAExyaAFrLuyF2hZaKx1A8n+WksHmvuNUvSdmsPargTNFidBLHWjVOarCygcd36HVnMV7JKJMpXKZ39oBPNy7u8EtZCRuL97j2j8SjcYQaFNZRCBGo/pG1q6aSbfUAZgxxWe0qimvTLZKurxbgp73bdvU2Y15K6rG2yf+Kd0ttAshdjfXHRdZj4bs7/WUmXN/aHw2LtdbsA0AlvK9P8X0LgjsTBVpyIgRLJiEjCoa6kh1kEGebWW4OCsBIRQlQqffODmKV+TIFlDRU/kYQrBbUZ7C15D6Is8dJtodzqYvKNi8VfAkb9F1ghDwOpyLZEBEfWqNti4P/slp09+nyfU4GLl6wxJhu6kHc+Fn5/dOm8BgdmZBsotbKqhintJM4
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NJtqwzfZ+Ckh+Ii4fCrQ9bdn2ZWuf1VUeZbJmyPOwSHmQcZPYceHkFfZs/wSXzAFOmWhqRqEsbjcbpeVtWTbwX6yXj5jYBE2aSkgqNooNd9juZh04ZlPGquhJjAnIypVPLQtfExFNrBpY+YPo+jXZpHxENkHK32AsIBUh2FM6WuoQcA3PXrZRolIhmhHKfNhYv8qt694sWf+tASaLmjO8AwmhSIgkf9ZG0hCU0dX9SJR2d+jFTz1iblhK+la4aInXaeAUM+CXnBiwEsWyWIY0GLgyiovzNaQ76cRKGyOayGy5imU+GcuzIkqS8ffea4nbF2mOSlg22qaqMbOhfAAMA04zjhQB+nzxApxY6Tbm3a2TMUgeYmCErT2fDNYMRohNCQEyLvCM0QMcX1tOBmWk9TJYbcf5/Hpdbsq7aPHMGY2odUsXdxot2xtQnAwPMNo
X-Exchange-RoutingPolicyChecked:
	eCsficXDReXw/IxY4aVBz/x8aibHugzd0MvfQx+dyWDyicxGTHz6BMh2+pkiiL3UkCP8uOczOxXL+/1jXLUM9xeNrCqP0oZekyra1D73kKr+uX+aCicLEej7X82taSCWtkTkQ4l9ff7UqLL9DLm6aaacX4o/56bpC3lCrkkzzkKoNW43IBfzbM8WMqRKozjzMFooJOsX2STUjwqF/e7Eygeh1k6h/ofmPjHA5v2up1nPXHwkrnw91O+PVV2CdL7YjzA21x7XFAddmjWHmrM8MmqsSivp7/DYePQ3D9QmsnvFq+Lxp3FxjGUa7/MuCx9SFnp0eyYfz9/Oy2hUfO5Axg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:21:33.4087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc9db1a-6c62-4447-0640-08dee96d55eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-GUID: RLR7mqidmo_056kRDKcErBJirCJYzxYb
X-Proofpoint-ORIG-GUID: RLR7mqidmo_056kRDKcErBJirCJYzxYb
X-Authority-Analysis: v=2.4 cv=dLWWXuZb c=1 sm=1 tr=0 ts=6a633cb4 cx=c_pps
 a=TQumU+mCWarTt0EIZfG+ng==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=YS4YLeW4SzYDQNh2yKMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfXwZeevSunhlTY
 jriThZn1B3CsP2GRYCYnvWeQ3GPpu/dnR2ZB2hHvZ4aJuvAXXsS4VTg5k8V+cRBjAwMnWxdHiIe
 zyYUeT+3d/UiQEFGJK/I2kuztNlVY5uOU14S44sQyXXaM0gEwz8dZcWOt+y9ReDM3aCUSimcGDy
 h3wSsAnqrenYiOHduDdoAwi8Hm+DQdvzjhsU/PRROiPr68IugAyMj8goKy6ZGq7IqpyBytSkJK9
 mvYpvYVI+kWU/39NFdv19nUe2rk9NQp9n53Xox8ZUTHk4gaqPlwz0TJ6B0UU6AKfO+WpVaS6qMf
 ioQRUcq42jBHHyKtabya31qEngpUpE5HPhV39nB6A8quyJbVQpFJMc3d6CdACDJUixI4km63/42
 JW2IPDdG9usgOJ2pXibaXS+kNjFB7C4IHm6Cw6VKvWhO8G6oVxTg/wOrOY1xCrYSLfpC+NB1Lce
 Hy7PnYGcDsQwU1YtMQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX2XKufJffZk1R
 //akE0oaxnMVpl84tMfhGDOSkdMlBwvKZfGsj8n693p51RUW5PAZk70Y6bAPasKjGpjgbFwSwVv
 v3OiJS9Zn4Heb4SB4uO0hF3yIE5ZIz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and thus can contain garbage which
can lead to k3_ringacc_dmarings use junk address for ringrt base leading
to below crash during ring pop

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this by explicitly initializing the variable to 0.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index fb21e0df5ab7b..48f4db777d924 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
-- 
2.54.0


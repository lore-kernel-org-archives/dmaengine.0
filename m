Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A243E072;
	Tue, 22 Sep 2026 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059816; cv=fail; b=sBOZ+F8DDtkQLxqwmbBlf+GxPkLUVPqPWucbtSpWLFqpzyP7ZvM2MfpdoIGGF4SnDY0OKi3tdFt/89jnwYQJ+8iFzjPzR8BxVmFWBcsi01vYzp2mtqZXe64gTLyJu1A3py8D7xfk4n2wsp2vL0E2ITd0ovfZ1QwqnnWGKhrIOWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059816; c=relaxed/simple;
	bh=Yb68ywnxktAOqzC7HH9iP2aGbIV1+15VbDByTdOE3mE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIL1wFVYF9qTmHJOfBK6p15p8E+bOXNloAJ4Sllv76xot8uuhmGMGzQhqPYdjj9tfE5zHBoMZMCawi2cmgn5RlJuu//dsTlsjNpRIQdpxq8MSgdU0sFggd02CUyZw/wFZxuMMWT8Y77G+EccjcKERbM2sUd9kDIhRHz+/NnQxbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GHIMFx2y; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rv8cRl8L; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GHIMFx2y";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rv8cRl8L"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M647cs935711;
	Tue, 22 Sep 2026 01:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MQ7P50QmbBfwGmZaR3Z/gNisrqNUd3IhQuygJr1B3
	UY=; b=GHIMFx2ykIGK4zScZle6ZbY9begaG8CjbAc2zxMe60llDMb4gVpmz/Dhz
	kUObVuyzJU9avvLIdLvYVASsQIzqgj6PCUdTKqEefX5Pmi7Aebg5zzox7QR9CIQP
	l6zrgwC8K2DP3npJYgnAZ35jzyrbdwLIOIryiZwz7PuYLWJ02YwkiV320RSm93/C
	LrQg48tG1GF2mQe391NPX5MQAWvizB593mTgdVUaBY8cuezbGZVMflCT2UTDp568
	GCDl3V4/IzjCMZqklI1lzjixIf1UHs3BkaavaAv0/m0CD9rwC/CKJ6q/BSHJZnah
	eL/AdNg+wzGD6dEa+mVSEZpIwjvSQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x1v0v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:49:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmOeZmyjtjEfTeaJ+wq/PNRpcyZulmLcI+pN6ArNw7rw3fNDZqnD8V/aDIGr/8Bgps1uZeAt6X20gbH54RR94Rd3ha2uhGgwu7vZm/dEiaAW6fXHkGo9wTE5RZ7j3tkKP3tp4Orv7GbI8ZjPZjF5rDIjaFlWv/a877Ilu4AvX2qNJL9PysQ7x75tp/BN5DeVQdVLjN4kDD1Rg9ilfS79TuCzVTqbKGwazrP2NvytY7Xc3vtO/d9i0lJ6D3VJOUUDWyjFWZYhVZPhnZ8TPBAU1N9RjC+Q00KQ2JZcd1H6XT+Q2bJz+u6D9HMuZRzKntvI31a/SynM9Rx3whUj7ZqHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ7P50QmbBfwGmZaR3Z/gNisrqNUd3IhQuygJr1B3UY=;
 b=ML/+Z/Gr0G0Og3/UDIC8MKf+06WgIG3mPht5FcsM5GY4DMASAIWgdxIbDSnB3yQkEO8kgc/qDYjBP2LI4qeddQfAsjbY+4e2wHmWV1jK0nAnLrd+GhsGwMOCj1a/IB65nFHBezh9mJhWD+YHdSbRVzFgb3FHTJIYL+CZD8PVjfcNKb8GYKISSjxjMY6LiBNCG2ae9hV6YQifjENr2d2ZPwMDwbwKEdZxsuqoQF4WEF0FdYtrpirZBgdYc16pCe0KY6JHE1nDlY95BYLPxSWlWjnbQ0LHkbqHxpoV605Ht7UGC9y8X2vb1j6wnpOlACZrYzGprlqYQhz61Se/jp8GWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ7P50QmbBfwGmZaR3Z/gNisrqNUd3IhQuygJr1B3UY=;
 b=rv8cRl8Ll+vTx/nPoOexK8wSNCOKtwTA1kKLNupLk25b7jQDoqMLariTlC5OKSDMrlUu/YtB2qt/vLFZUHIB0jCjWlU9qQ9KRP0qHy8Z+H+bhJwI71KU3VWCUaLotliQvrlesVxNlBo1BiVWxOio0w5VELMeeqplfgT9HkGg1UI=
Received: from SJ0PR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:334::17)
 by SA3PR10MB6952.namprd10.prod.outlook.com (2603:10b6:806:31b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 06:49:47 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::3a) by SJ0PR05CA0102.outlook.office365.com
 (2603:10b6:a03:334::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 06:49:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:49:46 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:28 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:28 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3r3626771;
	Tue, 22 Sep 2026 01:49:24 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
Date: Tue, 22 Sep 2026 12:17:25 +0530
Message-ID: <20260922064902.2719979-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SA3PR10MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: aac6ea30-425e-424e-4798-08df1875b100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|36860700016|82310400026|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SHAWD/rhxO8J7xEtWLJyseVXfVdvLlhpitJDA9pq5H2YxUDlvZLUxSMH8xpXXLVI5Om8gQxAAuypTqKkhPlccuYbQRtiDuWr1rqzEieNXzFrVFc8SB9JqMBK1Zr4qYCXGiw09VGe88cgdmpEveQNJ0DVRVBMWT1DjBE+iY10fNusg45+XZ5YNsUKyfAuzoLWArZazoNMNlAZKn1LEthNPPdJHyAPltpBV3bby/Ubt9642ZneQXNrJ0hcgjY3WgWfReYD9GYu6ravcvKtzBhndy6K3WTg0VlxqYUte07BjK/4rETS2swG/0IEsUz2k8BcwT8fkw1Z9IUL6sliS1k0pHoFJuoZNQ8zZ5JkmKyJLzD/svJp4Le+jUi+6hxlytMtkgKc6hcM9Zmzkj4oLjkzfBt47OUGFf/jVCJr1r13Y8bDHfNEnxYPOvZlddP/Z+FqlGjjUcEqwrcp4I0NiIYyZ8HimXq1lNa9aLUNQcM4omiQj/DvmswzO5TmqDlAqPQUe8y6DXa6r9AT8LntXJESKJs64Fd6ar6+LdRPN6CfIFnGeBqcvSksa9Kf+Z4pKlikINR8yxERCNPAgIsoG6xenVL9Rzwhlr+p9eyWGvtbfH+cnibgWOIIGzzs6Hshqmqmzrx6iiQlV9/An9+l1zR4u1EQ/WGGuyv1//0GJDHiHajYUdMAD0e3yUUWmrdOAWWBnvueFvtU3rPQpDD5lgV/1QeKdxNJS0YYE1PzaPLf1F3KO3za/SFoBk2Pa/A4itws
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(36860700016)(82310400026)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KTpnyjxfdVFI6df7gX7UYFiav9QIvEDrUdW2MP2FQ+9wuru7O9fiyHZ+qtyBnv5Mlt6+xl6LSdweJ4xDJemOTlURbbKUKMSF/aJ6Z4kwig5j2Y4jzS5hn28fEtQ3qvKIGoRtfriwRtwJB9Z9rriPP4JZRvLInV1oOZsV8EJ2gf3iIrvtqx1PSQ58qlc1z/VXX7GXa39ckt+SYappKy9XIrZ/kXXreNKe9fJy7A795pfwyV042nZGf+vN4fYZsHJyrCnihG6+uZ8oGhXUBOxMw4ejho+WND0QapO7eXS243vBuPxBhneHUWTF4xFKjMpiCx677WqSQgryGjcu34m7HyiDVJTgfczmSb3uzkw0YyLkG/ksdont30n4YQ1F8AT5LFhhzDG6dBU9nWSRpxMuJJ3ij2woqpFYdsN+9FAOLfB5TprbLzbnzWOT3Lg/k0Qn
X-Exchange-RoutingPolicyChecked:
	HMVMAq/PJlHDzDRB091jgy/wogOeN4H0x4MjWHCQ+NsMb/cgNqIUxrxfKBuVEPRXrylt/DHRgBN918r2xA8MelB6Y2TxjFRkXaM0jL6cQuH3mAaXHUARvNiGZLbkQbeKW3KCxEaHK6UkvOTkThzkwroj1BXVO80aTwwh4cqzaTKiw0l1G5RZVzcruIQlNDmvUT4iIs297zztdwxX8+tJ3LsG1WFLOzp6r0Kv+BTXuiBpRbrXSjzyp6FkVAK0pXyG8n93E3Fs+EuNFbc6fDvcqvFdmfLn8V13fxSZWdGM9hAhgc8V4KnXRfkzuBn6Y54AEPN0F2cPR5D6mqGZujSC2g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:49:46.8316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aac6ea30-425e-424e-4798-08df1875b100
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6952
X-Proofpoint-ORIG-GUID: dXhv4t_Fz_oKgs8f4myPbFJKao4wRC9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NiBTYWx0ZWRfX6a6JU2A97Oa3
 AQsMo4ecm0BLNVUP4sygD9CLZPK4oHExXnTqQEvcblJZt/6R67s1x7JZKqqQceCY3z/2dRm+OMQ
 Xx9/T8MyhPFyh0dNzTgsNPTemIlfzSXb7U7hU9dZPMP1eNhh0Sl/FKbIyF7aT29WxQ0NAaHxFX2
 q6rhSiV7AqDUPSJcunZ0j7QUWtwAgO5quWmYQ/qaXu4ytog0+RfOCRAfIAtDDbDOxslm9QCUfZm
 bsuBdiKUffVWWRwSYb2hsVVpXlnh7PtukLivrAhVOtN+MtoYyQzyFddT4v3HeK55LtAbKgFClHd
 6EdkKUj5HGi8HJ/zaI36L0KeLKekuhxlOyTMQLKs+mzIZorPLiIkXW7Uws7gOahQEiHxMP1QVa9
 cn+8SWxwl0bNaoV7O4ELTvhoxD8VPzJdg8Y7EdqcHzHnkaDxWuZ9DMIVBg/KaSu9Dx5V+NFOmoH
 PY1H4r6+yZMrSHq+InQ==
X-Proofpoint-GUID: dXhv4t_Fz_oKgs8f4myPbFJKao4wRC9a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NiBTYWx0ZWRfX3qgqIXQcSFeM
 nmB+bFHTeTTym63f1SKh1hDsPDC4RpykfR19faXYRBziI3m4IwBDFx4XcPk0WFTU/A+xtg6rW9Z
 7pI495jCELc/I3WopS51IQ43YA/W+1A=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab22515 cx=c_pps
 a=G0fLBfPV4gnnEhzimi2a/Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=YS4YLeW4SzYDQNh2yKMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220096

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

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 78a67cb9d6e00..8457644cb9132 100644
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


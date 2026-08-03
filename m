Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9226837FF75
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753122; cv=none; b=BTjpqqbcO65q/TZHXgzCKRkWWmCWM+GLgdewa1MxIgvV33l6rmNAFfsQkde9u1qh+QdhqosCukkEpyF8M62V7cZODBnV5qxjrfWmxizYOkdTo9G/OKzywpWmqLMdY2Fz7ngRvU12EkICVPw3q91wQyyu67c9VQRDMPYzaeR6R+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753122; c=relaxed/simple;
	bh=BGCmXbHhxIgOfT5cff3VPGGTbFd1u5HedyxcoL2ElDM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S4TUfIFeyoz/2u1XIeUJrhc949evH68rHq4uhY268NPndBAr67+n38PsfHphr3fA7wAxCeiqkmr88lLQKqT4jI9gZYb0axioJIEWQjrTttm9URG+2NBU7LbH3G7vKPzxkqyqwun+46kxDZahDqd/kf0B6/tzaCBft6EalVITdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTuA/tUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+1BqC04; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTuA/tUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+1BqC04"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6739muMM3654505
	for <dmaengine@vger.kernel.org>; Mon, 3 Aug 2026 10:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zgHwwbNKVvtriJyQ8oychC
	OjzeAxXuw2oCV9B5T/Egc=; b=nTuA/tUkTv/kamyHndVR7iTTpjWBZxWkLVHFoZ
	+KxsEtDXGd1jMDB61ZqbkuBHl63GSMp7M+SHbgFC2f0kDYfjuzi4nkxDW5Ji3AQC
	Ew2qsZU914v1UgvGPBllhC+Q+Xrh7WdcME8CIqGGjDw3vm/tSlGUdqk3Ufr3O1Ku
	N5Dwq4+QLP/5LRPCTATe2OxUwAnZadmXoWQn2f7lGKBdIh3lS714pChEZA0U6VIz
	zK0B7hMljT3GYWQSYFd43T1VlACI02QzhZ9tHWzLwhmXlTfKHkrrXBpClqmUdPaU
	7BJ173iqDEvjMCDHu1g6jd1xQYVxPLTdSxyAj2BnOHeN8fAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb14bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 10:31:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3219769a91.1
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753113; x=1786357913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zgHwwbNKVvtriJyQ8oychCOjzeAxXuw2oCV9B5T/Egc=;
        b=H+1BqC04MRAN/YMWwrafMztz2CWtFjlpy4iBM1Y0FixadJkbOqIjruhVIeWmUyPwZe
         J679FUP2YVRKXc/y4mDtRy7rgBFf7Kw6AqQVRnvkIjmqV+SLeRq2k/nJbz6Y12rJTO5F
         a3baE41KNOQ/K8obj8zioaRb7JklqN0RWO9OfanjLPlqVtksu1/yWeOCv/PgEr2NQ8iQ
         fNKOs5E+ttfKNzmmhYyNDvFEihuQCFb4CzyoLOQRefYrrk5MRoFNwtQ1RSswvwHHOTgn
         PJCnW09isLhedKSsoAQqTVKquoYuORKm6/K/2S7nMoFBKkn8fP64h3jF++qb5lLVPGDc
         oDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753113; x=1786357913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zgHwwbNKVvtriJyQ8oychCOjzeAxXuw2oCV9B5T/Egc=;
        b=halIcSjmD9Gl50iIJikhe532DlDYTMF9zKOPIgmmWU/PwS5w2wkbs2BTAXc44QNCnl
         EXWjfcDQGwhFmCX7d78HeiTBwKTHIUzZJ0qcF9QnBnPSAdtscGaUteAuiXd3p+1nmDzP
         cXf2MQl+LNwbKp3ibG/vTPoIIHRkKme8DAdQQMJRd9u6ORWtKk/CarA30rF/S/7XyDUa
         I4Gwu0T1C4bujLusjNQ1PJD5q18Px0WWr2ighAt/UpCbYjjEkNuiF4ME8RPqtNx2l09z
         2sftprRKsPYNOrw4q2hxhLyO31EdtNYVZ+O01KWunNZ1OXRhwhznyhjJhPjXBDgvusY3
         /ruA==
X-Gm-Message-State: AOJu0Yz1+eq91L4VqS8M/f9amRIjxOwtfJnxWa27IA20hcGVD3WjqbrN
	sae6LruMoLiitQlqjd9crB0jzImJS6eQR+AXAiMEnifD12UFpi7BhUOgOhcTp3Y33SL/m1WEQOQ
	HCptnejVR6xfJY+IFXt26fnZKLN0MfRz89lWlqZr4GHWuNpBS1sI33gB4I3EI58o=
X-Gm-Gg: AR+sD130hZXrCN985Ctqt7NUpghg1r54BdqZ33s11py7+Em/8/F8UkbcaaN49VefilY
	pOhjw84fqy+Z2AvYZCQBR5uYWiiTFdpSwe70t9i4Zko4erpVZMBI7o7r7BwiqObHGH1+e9wxjY5
	eYIuDlr4p7HbtN6ET4b6FoYI3BgSHHSVUaapVQYivBOUm0WES+bcSpTQk3C8IOMFZ2HPGA5/InM
	cqNBFpeXr778Brh+805yT5biD1yIVmSdo5qm0CJaSV75p04/24etHdsmZSLDpIPnqVuhvWGLS0d
	fESltKZxaHgyuTWcI/czmb+i5O/mqxCUTqPePoUrN3AUDsDu3QM4jIt4vN9t30Sv04vVw31Gm1N
	lZAd5zdl3rGKk6g/rJI4cunXHRQ==
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr9020469a91.25.1785753112667;
        Mon, 03 Aug 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr9020430a91.25.1785753112056;
        Mon, 03 Aug 2026 03:31:52 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:31:51 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dmaengine: Add batched scatter-gather DMA support
Date: Mon, 03 Aug 2026 16:01:42 +0530
Message-Id: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5ucGoC/22NQQ6CMBBFr2K6tqQzFYquvIchpJQCTSjVFoiGc
 HcLroxuJnk/eW8WErQ3OpDLYSFezyYYN0TA44GoTg6tpqaOTJBhxoDltLaytFM/mjK0VCGILGV
 ccIUkKnevG/Pcc7cicmfC6Pxrr8+wrZ8QMv4dmoEyCies4hOtBTRXF0LymGSvnLVJPFt+dzn8c
 /NGVhWrQYr0/OsW67q+Aeq+ncDrAAAA
X-Change-ID: 20260108-dma_multi_sg-c217650373c2
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=3409;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=BGCmXbHhxIgOfT5cff3VPGGTbFd1u5HedyxcoL2ElDM=;
 b=3ePDXcG5W+TskRXsGjtBwRB+Q/3qztjHur37oK0opgOyU90+NOpk8t6FzjwxRCSn0ogr2u4Fb
 V7lOTbCJrx4A13InzkcAnsKJbnysxPWhWqpGWIrXoTb9iXUORuesWIL
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: Ylau9OG8REbhUNGl86ps1gGsyMaSFwXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXxWg38Q451d7f
 IIdFyHLWgj0oG8lXI4H/m3vSuCTzTiWIGG5ipcYl1szqoHiymUiUvshb+p6TanWFOaT1yreMQWj
 mlhJTq6DfPfB8jZguUb6NcEUfQtieiU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXxe+99i4u2eOv
 BEWOiZQQKpy4I6YZp2UMjCWxclLszwVCinvjC+0JzJIropOv5rl781qe96+wfSiLouNNQr3YsVt
 LW3vp349C/OGi8ctGruGNllE3xEtkYvWxE/A5D1lcyP1/zfuq1lfG5DC4HwYAIJw/L0N7gotU11
 rBp8fEhTjW9spNyFo3kdLnldEuB8/oWHqh/XIzMUkmMQjZQvdASt8a0PHigdORH14wOJtQY8GBC
 exe79rW78gC/qKOKc3kFMn8FPtaHkezfeCjyAuRd+s0ZUIxABphaxNXY73Bn4wgjsNDcsCKSBQH
 5RTJNXvA+PGI0WpSGAXX9uK6X+bskTXh2KX/t83I7X2BsvMr/UDR0KNUSr1AzYJaJ9oUmdWhctw
 gkc0iwVKoJacLMOoX2KGqTsQQ83zXEm4LgmYmIm5SRNMODQg3wmLN43/xjvpfi+hAQ30T0lVyRF
 Yy4WbcV4BAXeVOAleGQ==
X-Proofpoint-GUID: Ylau9OG8REbhUNGl86ps1gGsyMaSFwXR
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a706e19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mBxW1p0v9Tj6UMWjSKQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Synopsys DesignWare eDMA IP supports a linked-list (LL) mode where
each LL item carries independent source and destination addresses.
This allows multiple independent memory transfers to be described in
a single linked list and submitted to the hardware as one DMA
transaction, without any CPU intervention between items. The IP
processes LL items strictly in order, guaranteeing that
scatter-gather entries are never reordered.

The `DMA_SG` transaction type and `device_prep_dma_sg()` API were
previously removed from the dmaengine core in commit c678fa66341c
("dmaengine: remove DMA_SG as it is dead code in kernel") because
there were no in-tree users at the time.

This series reintroduces `DMA_SG` and `device_prep_dma_sg()`.

The reintroduced API takes separate source and destination
scatter-gather lists, where entry `i` of the source list is
transferred to entry `i` of the destination list. This enables the
eDMA hardware to process all pairs as a single transaction without
CPU intervention between transfers.

The primary use case is MHI endpoint ring caching. When an MHI ring
wraps around, data spans two non-contiguous memory regions (tail and
head portions). Previously this required two separate DMA
transactions with two interrupts. With this series, both regions are
submitted as a single batched transaction, reducing submission
overhead and interrupt count.

The series includes:
1. Core DMA engine API and DW eDMA driver implementation
2. PCI EPF MHI driver support for batched transfers
3. MHI endpoint ring caching optimization using batched reads

Expected benefits:
- Reduced DMA submission overhead for multiple transfers
- Better hardware utilization through batched operations
- Lower latency for ring wraparound scenarios

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Reintroduce `DMA_SG` and `device_prep_dma_sg()` instead of a new
  API. (Vinod)
- Use two parallel scatterlist arrays (src_sg/dst_sg) instead of
  extending struct scatterlist with a second DMA address. (Robin
  Murphy)
- Add explicit eDMA LL hardware description and ordering guarantee to
  cover letter. (Mani)
- Link to v1: https://lore.kernel.org/r/20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com

---
Sumit Kumar (5):
      dmaengine: Add DMA_SG support for multi-buffer scatter-gather transfers
      dmaengine: dw-edma: Add DMA_SG support
      PCI: epf-mhi: Use a define for the DMA transfer timeout
      PCI: epf-mhi: Add batched DMA read support
      bus: mhi: ep: Use batched read for ring caching

 Documentation/driver-api/dmaengine/provider.rst |  21 +++
 drivers/bus/mhi/ep/main.c                       |   3 +-
 drivers/bus/mhi/ep/ring.c                       |  36 +++---
 drivers/dma/dmaengine.c                         |   1 +
 drivers/dma/dw-edma/dw-edma-core.c              |  87 ++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h              |  10 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c    | 165 +++++++++++++++++++++++-
 include/linux/dmaengine.h                       |  35 +++++
 include/linux/mhi_ep.h                          |   7 +
 9 files changed, 339 insertions(+), 26 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260108-dma_multi_sg-c217650373c2

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18266329C71
	for <dmaengine@vger.kernel.org>; Sun,  2 Aug 2026 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785701075; cv=none; b=LaCbhVfPBe7oKD22I9mmPwbQggUFwdf5dQSGYALn2mGRcgBUU4ncvHSIG1mmbnrHvYvc20efZwkHCGvOJGyx03S/M/6PyR93EwGfNg+JsbAQoXV5K8+41XKowq3/4rWp0FQy/6CDkm/nsXUagLCKBFa3dmXaTRB9bZEd/9clSU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785701075; c=relaxed/simple;
	bh=qltARmYzXUm3qHAeK/h0ZIoqQNWedRlot+Q0d5xsxlg=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=aAP76I/Nt5yx7IQQHL/phniGui7XoaG4kd5mARzJyT4MaoEil1ExOWgEbqIeob/W/CmDLAteFjSyg4+yaoI75b6LPhKzPYh4PKBmG5nQ9uFi/pk27b0UDppAuxjpErZXiBlkxZhw9Buz5CHCZeuO7Pwt0++56tLgLq6E9VbSSBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=pass smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=STerjj8i; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=EIe6Qozr; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="STerjj8i";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="EIe6Qozr"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.126] (unknown [10.138.12.203])
	by mtl-mta02-out1 (Halon) with ESMTP
	id 43548c66-9b8f-45a6-a9a5-19585489a9fd;
	Sun, 02 Aug 2026 20:04:33 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-3) with SMTP id
 4ca05eca-7873-4cec-9f8b-481e452ea224  for dmaengine@vger.kernel.org;
  Sun, 02 Aug 2026 20:04:15 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [191.177.202.7])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id 4ca05eca-7873-4cec-9f8b-481e452ea224;
	Sun, 02 Aug 2026 20:04:15 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: Availability Update: Memory, GPU & Server Components
To: <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Sun, 2 Aug 2026 21:04:15 +0100
Message-Id: <021520260804215AF7D90D1F-4CCFBFB675@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: 4ca05eca-7873-4cec-9f8b-481e452ea224
X-SMTPCOM-Message-ID: 325ae769-98b1-4073-a53a-aa07260017ad
X-SMTPCOM-Payload: 
 xU5LwCNaLlNjoogemQwE6Wie7sN8It8Kte6pDzSBC-w_KjO7q-nrIGglOTJFYghF1KosGJeO_etmWuvI_mkk3FoiBH6ISBdA9Nvahdq9kHXd8C29K-2GyxGv4NrJ0-vK4P4kmGKORAGNhr7D18Krrj19eQPligIi7eHEfEmRrt64fgX6Vs_k0bCehwWGgV5s
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1785701065; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qltARmYzXUm3qHAeK/h0ZIoqQNWedRlot+Q0d5xsxlg=;
 b=STerjj8iPVPDIdIKoqjdRTquwkhf3c4as43nJI+HDzV/d8waMeFS+KJV/vfDvZNxEwYjo
 a4sWt0EVZT5z7Rv65fS3QUeob0IlYwJLq2+njauxcJO6C2mpOY+jmE15QuU9pWEVksoWPVS
 7QrW33gl5lbHqpMd51GPWgXFT+z3gdDZW3wLuN6Kcdjy9MqbezCz/bS/PhL0brqa00bli0G
 dO0ZvnLSSKKff4P8fMLK9atlBH5lsSJiC1JpDikiU4y9zFttOBRjcc1wRNHVGF/nh3TbWd2
 aysBYU2o7i/nYvOlpc0V4Dk/4iZu7eYKmHqh7J4YW10mQYPD3qkCXdraXr9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1785701065;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qltARmYzXUm3qHAeK/h0ZIoqQNWedRlot+Q0d5xsxlg=;
 b=EIe6QozrF5b8Lx63o75Es4ztvPjpOrQVTl5j7xO+c11dlJUAFzQ9TB3+ohWj0Nk5hvXVA
 quCV6kOZtalvPLdYBcZIRcdew1k8vPNXu9ZefF57oU2ZVj1ajfTOGX8Shwvij8VRH+px6dv
 4O1NzSSiudBh2TwjtJ2randqsgOjoI866x9a5pVrPegyYW4YQav7niryribWlF+fidFQkhm
 5l8IC1Yi78hqvtLox0i3h7gpYAa69hvQ/hooyrVdYaYra4XYPieCo+VKT+2sR/E1awVu4Qd
 3Hi/f8NQp5xAzHL6Fl/mRW/R/uFA7UDt1EoWTSbFcx4+MnvVh1LefTjWq+TQ==
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Dear Partner,
We’re pleased to share a current snapshot of our available inventory for
immediate dispatch.

Memory Modules
32GB 2Rx4 PC4-2400T (1,500 units) – $40
32GB 2Rx4 PC4-3200AA (1,500 units) – $40
16GB 2Rx8 PC4-3200AA (1,500 units) – $20
128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (980 units) – $170
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $750.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $850.00

GPUs & Accelerators
RTX 5090 Founders Edition 32GB (90 units) – $2,800
RTX 4090 24GB (45 units) – $1,700
RTX 4090 Founders Edition 24GB (90 units) – $2,500
RTX A6000 48GB Ada (54 units) – $1,100
RTX 6000 48GB Ada (51 units) – $1,200
Nvidia L40s GPU (12 units) – $3,000
Nvidia H100 80GB PCIe (9 units) – $20,000
Nvidia PRO 6000 96G Server Edition - $10,000.00 QTY: 17
Storage & CPUs
Samsung PM9A3 2.5" SSD PCIe 4.0 7.68TB (115 units) – $650
7.68TB SAS SSD 2.5" 12G Server Drive (140 units) – $650
Intel Xeon Silver 4214R (120 units) – $140
Intel Xeon Gold 5220R (130 units) – $200
AMD EPYC 7542 (97 units) – $450
Intel Xeon Platinum 8380 (95 units) – $450

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com
Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-4364
Thank you for your continued partnership.
Ann Sam
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA
To opt out of future updates, reply with “REMOVE” in the subject line.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648068;
	b=twr1zFm9dnDsiQK/NaUmmIzoGGAXRlXAWptW7WdPb/Jx0AR4qcX9KFkdP6CrnQweqzkS
	 ahZcBXO96Nx9/0/gzDefO8XqaOjCc4XVuTwVNGtF0c2aZ0YAZPgOvaZTNvYgK0zeNCMvA
	 VnEpr0pGBb8wfk4geseosEz0iQe5rFUuk+kSnbUcwke2MYoMo/Q/puQ66GpWi94OLNaGK
	 ovbHAVe3kLL/SRf72AtJrlGqXX5OJNf8sedXCZKLEsPS7wY78eyFZN7Pqe63wUxUdMyo2
	 E21RD9WGMF8q6SEE44UZz5zSeVJCrRh1RppV+X2gd0R7YNeYG12ldcC97yinp/JbjrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1CHohurHwGW0s3Zm6Rv+GbWfGWzISEwRaF9a5zGiOwM=;
	b=LF+r9TYaA+2QbISFyxCdZ/1+owFNRKhRDRAxQZY2Xpp1rE9lyl7JEhNIColfr/E0p0BU
	 No8UqlwNxCqxZEgD73tKcrzsWFGv1DMU7BvGVNKP0ktfAVEvyUNcaaQb1BNOfBaiKj35F
	 xrQQ0jVgD20mHEzPJI7X38A5OpdSEVL478CuwNSwwEsU7zPdNZwd+AtBcbT/aOmwjgqIw
	 0S/2GRqvjKGFimtZaXBuRnkexw2wrv4/CdsqxPERQzTF+kGXclzWnBn3/JYrNKVWTxRAj
	 kag1f9I37BL9ReBrJZuesTgo30/ILinYPbR8fB9yd4aXHRTynKiZ+6U/8tKpiCuj6qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdjD3gzW;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB2606EEAB
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 19:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCB2606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdjD3gzW
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a451915d8aso2627144b6e.2
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 11:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648066; x=1794252866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CHohurHwGW0s3Zm6Rv+GbWfGWzISEwRaF9a5zGiOwM=;
        b=sdjD3gzW91d/Yiofsx/4ymGX7zchBWu44Xh0qiZRbHLso9tI5+BU16O/HChBvG5dxW
         1MRsdtju6i3dw8lmSCvReHAu6mKtST8cclRlFhLPufQjCKlif68GPo7d49XAw5OXImcn
         CxzTbliT13pYgN0rqr9Ak7znACLFtYlV1aia4ar0Lb2s08bjShTlL+PltykxUXIn7jJ0
         TIn/D90TDYLKWKYn3RDwaMW05UER2+YNFVPmjOIPif398NrCc0lZn4EWGZRpeoKygfqR
         jnn5degMOYZAvL0JqUvJqGuPRaO4EY9CnKxVpszoxisio+WoHIj0Pu/nht+yGxICYP2R
         eXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648066; x=1794252866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CHohurHwGW0s3Zm6Rv+GbWfGWzISEwRaF9a5zGiOwM=;
        b=s3nNEgq/+bSM9RD5FOO0ZVsMJwK5gfgwcRdqdBsLF40HNJWwBcsELg5paFNsGLHn3V
         CovbOzf/ZBpGRKwAkcblc/lwp1E69vs2Q4opY59OjsOtS70PCpH5OJ/ZpXcBd3fT72k9
         gtNDtvrilsgXd3hzuu3QTK+JjWk5U5nkpBpBLHMlniuhNHrDt5sK2/CtdAH8ZDopp3Ai
         jl350lQ/JtmTgD8p7Vpmsq/4ChzeNM0TEzcDUpRPWaBIpbLaJiSU0+4PPLmtVuHaZ9by
         vHZuLCylWZvitHMSoaj3yvyVxRtLGp6jtU01WAQ9dhwNI7YpzwASMUO2YLpQOXlIAlyW
         tfiA==
X-Forwarded-Encrypted: i=1; AKwUvByzxXOvoolrIyNWFKvUh0UPG6vI8dpliuZurNAL8ECG7swRj1FdD/jIHBLbRrbSRiwfrv7V+EwJ6mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhpYlVhOw8C6YEKCAW9waxnIS0nXpiiD5rFxIx27R8er7/uv0i
	oy2P6eHrgbmTJYUCqUeU8RjtuQ07jGkyD/zohbNV8Hd3HnK1agFZdz6D
X-Gm-Gg: AYBFou2q8o0X530C7vV6NUMM0vDxGZp/AadILR+VyoEjHYBHfC+0TE6vY1NIRF6wnqJ
	QdOMkrort0EqZmEqTnnLeTRHhrzrZTxKhaool0gLGbu6lwD8oc/CXj8F4u4CsrkIcNpQKJ4B2sb
	QnJ3CNWusN92HGn8M46O1khF6Cxb4kn11HDUVBxUrOhc+IDtRuen0JiDTefhpiOX46aVGIkDu4H
	wsMJKG2vRxruHgcPjikBzCm5a8XSvmZCuqI3zx4x0znKwQ6OaOXVO1iUpviXL0M0jhua4eyeL4Q
	HNAkqxFtAbztlC93fnh6VzMt862+zaDQ8K0spRUNbB8bJlbndmDgRzggln7AC2/6nc5c+rav4SD
	YPkN9EyPTocrjHwCjTPQoG1CApymUoO4CwzLCH0rnT8vrnE9zIdFDd7o0YWunHfhRdUgrnhgXzM
	VzN5wGhfiPjZa9Y711zSv6tMmSuAoBsJrPNcN9nkY4blKgF5BAOU9OUm5gbhVwJuCFDaLqWAIxy
	S+ydGSJI7Vtiz66lWBnWOsR3h6hcUG1L2MjJ+vXtBHzDCe/pPK00H5yvb6yAo6CxtQBq/W5OksJ
	vFMCPMhk/DADiqGXexZEuXOCBC5HA+dhk+5o8ppmBbFWyxLJONtFmoNCLC9UP/hTrOc/GlV7FYO
	mDj66LS5Zv6g3JYLdzgYmxenTsu9Mo+vWjXuiXA3KKjF9XsZjdYbiFHbdgjRPV6Rc9xYPcMews4
	wZIgMcEKFZ32CmsykKvheprHG68XoC6xz92JoosUG9V+3LqLEjebadUKXGe3sWgSpUikHpOntl
X-Received: by 2002:a05:6808:2382:b0:4cb:abff:3db9 with SMTP id 5614622812f47-5640d916930mr7379458b6e.9.1793648066236;
        Mon, 02 Nov 2026 11:34:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:34:19 -0700
Subject: [PATCH v5 07/10] dmaengine: dw: report residue for queued
 transfers
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-7-d3207758fbf9@gmail.com>
References: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
In-Reply-To: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only searches the active list, so a status query reports
zero residue for the queued cookie even though none of its data has been
transferred.

Search the queue as well. The status getter already reports total_len for
a descriptor that is not the active transaction, giving queued transfers
their full remaining length.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---

Changelog RFC:
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.
---
 drivers/dma/dw/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index e198c9f45f0b..0fd49ff9257f 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -901,6 +901,10 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 		if (desc->txd.cookie == c)
 			return desc;
 
+	list_for_each_entry(desc, &dwc->queue, desc_node)
+		if (desc->txd.cookie == c)
+			return desc;
+
 	return NULL;
 }
 

-- 
2.53.0


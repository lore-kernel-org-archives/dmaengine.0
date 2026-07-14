Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEC531064B
	for <dmaengine@vger.kernel.org>; Tue, 14 Jul 2026 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.13.31.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006299; cv=none; b=cIhReiLfKiAdRD2M8jnszK/pUmpPf+UiyofhRnGuENLDjIRfHNj07ST+LTuagznn6yOmOkhH1RV4ofLVUBWf/J8DDLIBFVfjYW7y8w4/wts6ScnV04fz3ai+ppm9jkmq9eKTCtfpZ6BQHLr5/DWx9iJilfIgvXMW/maNF96acOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006299; c=relaxed/simple;
	bh=lPFUcXwckBOEMZysAAZjsjoknLraR5HazjmrQiw79z0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u93q53BUEiivlr6kcXR7p1cY2L/QIKfibfIty4+KuxMuGeJDbyS7Xon3rginEMzPGW+zHlsioRX3IsNTSwfERPMM9D/19bS724X4lZUKjjfB8iP4A99xabOF4hcGFYivZSKFfQyKibdkFymssZkufPou1+D1EADua6siZQOVeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=K78tWseG; arc=none smtp.client-ip=103.13.31.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b="K78tWseG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lPFUcXwckBOEMZysAAZjsjoknLraR5HazjmrQiw79z0=; b=K78tWseGtKeKhYD48DDYdJYi6d
	KLH8x5LboEWOSBRHFC4ncr10tgvdOKn8lq7R3ivVxMdlaGH6MWwADJVtTlo+iWobwTQTxQUlQPWxI
	B1ebelurDFXj7bbTFHLxMO4Q/pAmGqrWJlHgTMbc5budjx+N/azx9jJfc7dSComFGFqu6uNp7JJor
	30cPIhALBRJ3PckNwYDTddKfAwcY0NIJdPfh8fMFFZnNYz6+pIQIv5VEleDv1OavEabs3AFFOOIt3
	rr4i87k/iQ/M+6ND1OTAh0T6XxvJElxP8U7BxPnyRfBIYsMe8+KSjsnNt6s6R7t6IxUg/txvsqmG4
	TRyhSGRw==;
Received: from [207.189.26.187] (port=61482)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVX5-0000000Fsnz-2yz6
	for dmaengine@vger.kernel.org;
	Tue, 14 Jul 2026 12:18:14 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: dmaengine@vger.kernel.org
Subject: Dear dmaengine, project info
Date: 14 Jul 2026 00:18:11 -0500
Message-ID: <20260714001810.AB9CE9D31575C7E1@inbox.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 


Re:Good day dmaengine,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA



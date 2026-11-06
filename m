Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793968339;
	b=hSct6cPfnJrs5eu7LRaRibobJTaFOMHH7Hsh6PoW5RD5//lTxEFKdSa1tAyOC9Uk5MQp
	 u1TJUirwD2IG1onYnGipM/SYLpSw1GNO2MpWUviyWv7yM7mFMhjbg8BYIKqyOcTG5+/0x
	 m0sLX8crkg55iuS9O4TOkHTgbqKYao6AMcpL5v93gNCnfXmLMkG1JPaktKMcYzEDmJPN4
	 Sufy91B97cFIYZmvR0+f8OTRQ7krFsYQnFHNhPUEVH0LZl2pJcoz7sdXMYGeVkuliqgNS
	 GztuL7tYDqbDEWFa73XcDT7lzRCdakPUERPG/JO1qhZHVnOyrWiP4NSMUU+euwDfpuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968339;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=6OOI4uN4ZNBw4JFqa+LF+FC6kawQCHJkDgEGI5H+JNg=;
	b=gy9t4i/8xEFMFPk0e+ZrpuchTSsN6Xw4BWLUxVpU+0Y6dHmisbGWIWTihA1EtOlkOAqd
	 cbhKHaH0T+tP+e6YRgL7ApjqlAYXUJYqV+bm1yOBl/GKEYdtxBg/yX+kMAe/AbCjosgOC
	 6kXAVzGvBGPLbv7fEAuOkQXiwnmBiwITfMEQqFxqlAcwOJfOFLLZkJz74/+fT0RkZaOTu
	 RLQSp+rmJ/uA4yTVMFhWOmrxg5dMFC4cTCCHCCZAUuKPQKe/XVdEd0WjYFtG7KgzBzMfa
	 eOMgRhUxYBiBqg5I5OxBbwBBEF1sp6C0tHV2SuGKGkADbd1QORAfCAby+IPV2GBbErQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gnKk7Jsd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BE606A32D;
	Fri,  6 Nov 2026 12:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE8BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gnKk7Jsd
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 014EE2006C0;
	Fri, 06 Nov 2026 13:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793968336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6OOI4uN4ZNBw4JFqa+LF+FC6kawQCHJkDgEGI5H+JNg=;
	b=gnKk7JsdpfNrBDSWdGD3nLfq6YEsnVcbzyInN63e/mxUaJg7GJSuV6uXb2aT2EsriJz5gy
	3y442Z4dQD4xfLIAv2VC+pcHa7wohOcsVBqS/4p66x0FL3wMJmnIaqtJ9U+I/m35leXqpu
	Sj5M46KpZFtBzC01H8Ccf4YsWQqux2Ilrw3G5LPgI3TEBsBShprOGb1KF96er96ecHOUIB
	RKCt/tNkZ1Ue3UEr/zuBpAII3ce2lLR+cmyyCB00h8k3Y7Ekfh8Ek7RN9SsjiDuSaN3fBH
	iwXFV60IkSXYZX3OH+iYjXFDAhMOkW94sALwKRkjyWceUNRT56eIVjsdoYEhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793968336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6OOI4uN4ZNBw4JFqa+LF+FC6kawQCHJkDgEGI5H+JNg=;
	b=L22ZKg4bLh6RByj1/oAZNxbxFxebb4nt0TDmmMpNBiyh+QIHv18X+tipEF8Npz/AvMM0RK
	Ke2Tyzs+GsmuJGLYU94fWPpf+P3gaLIImkKf7U913OMFXARWGzVWEesuSxer5dRUDM9+L6
	auCjqT/Da9UKmqyo3H7ZEfl1ikBZzPzwwy0GPX/S7w3S2Rk/8TVMCKIQi1qlSJyUBGeg/9
	dNpc8Xjk7QQzOVpznLpXrNm/ipyolsgZ//vQflmn5r9gcJCymF685JySl9eIawL/pWdRWK
	sNBDgo4Sd8j298L8l4pAbGmtPo1/9ModR4/4pPqoZ4lIAtbVLlaF9wNyKV3weQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793968336; a=rsa-sha256;
	cv=none;
	b=UW0X6VuJEdxUkhyvudlbOuri/l/SlC4PrB2mel7gaQ1kl5Eh7XOfoVprISCBL2GzdQCFfT
	/Z9FUC+8/jeXub2W4j9YscKXbL9u1gvdFVg2QqGvlWOY93p2mWYHinU9tM3cB4XaaXle0O
	iRFGEOzL5X119ehbve/qqTEPYPyO0Vu01gOBEOT4yVL5/1V40cFq8xWH7TR4ax3LF6HYqS
	qbbwaPwKtk8U5V6DnUpJasrm1Fs4EVG3DVt8MWOkOTsMNx6ph04Lwv5LReqZ0fdl1uMETv
	Grq7J9eaXrEgNm1Y/zhYRkl1tCHv6EOhXPBMUyV6eHWv4ZJzMIck3qqoY/T75Q==
Message-ID: <c644d3e7cab1af09c29a5e0aa5021c2be232ca2f.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] dmaengine: pl08x: Release the reset before
 reading registers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Yang <mmyangfl@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 13:32:15 +0100
In-Reply-To: <20261106072602.77560-2-mmyangfl@gmail.com>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
	 <20261106072602.77560-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-11-06 at 15:25 +0800, David Yang wrote:
> amba_read_periphid() happens to release the reset. A node that carries
> arm,primecell-periphid never reaches it. Take the reset shared and
> release it ourselves.
>=20
> Signed-off-by: David Yang <mmyangfl@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

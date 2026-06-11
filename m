Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9A3546E2;
	Thu, 11 Jun 2026 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157101; cv=none; b=rWQmbVXdtsHxNcdKLh9vanNiLI631TxsmHcfEuy31tl/ejQk/dE2P1r5hSnGUbL/CeHJG4vkcAYKB+y28RYAcdp8Z/eXguxro6UPgBBdKMcRR1Hxtq3R0QLZDxKXSeeN4WnY67iBpD9POVrPZBPdSG+WWCjyOa/jeYjYOBfiyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157101; c=relaxed/simple;
	bh=xsWaDXJ2Lijvj/b35Oc3lpumaiAMqzwqLojdbybEV7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qYkvu8sgKAWU759jR8GdYBfgsm6w/c1337Yt77h2iccF+E6Cj1hu3GDsbYsjDtRegkxlY51Pc39SFdxhBzSJLlhPl+zYXg42q71FlqpB5ZAXPZrJ9Z2hMV+JNDoCJmmRRs1nTOjoSCdPK+7VfKUsZBHVSgeBY9w56dJKOVC82NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpIYlfu2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpIYlfu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA86F1F00893;
	Thu, 11 Jun 2026 05:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157098;
	bh=iMYY/GPoBfGBXP9b6MNvaXHdnKeIm9TXRCLui0kx+4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LpIYlfu2G9TUbsfHA6m9Q26CCVs2dwNwVvvgv3hs6X2BW11dyLrHv6Cofu3G+MBIm
	 xb80Z6Wspnc6JJotWNHRih1Uch+3nXYfWOR0J2fyY4OC7TYZYOxED4xKodc0FdKcee
	 VDKz7o7y8ddSfxQ7kw+HykCbFVSXYuFMQXu+LQJE4ayydmcxweA/FmPVqTdlF61B7R
	 XqbvkeZaW+sBscAatwCc2DSJ0G+wfAyrlp/tXsFOd2m3FsDN8l3RcPKRMPkK7yyKaB
	 CqEJsVIbIIRGy5lzGXlXEDT0Ju16XI1lRaghVezIKdrP+GenHqOuRLhPBKkWR1CIXO
	 lT+6FVak91C5Q==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260423173602.92503-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423173602.92503-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dmaengine: qcom: Unify user-visible "Qualcomm" name
Message-Id: <178115709637.468137.5781172438800883837.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:36 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 23 Apr 2026 19:36:03 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] dmaengine: qcom: Unify user-visible "Qualcomm" name
      commit: 29d0b2696d4602d36d91dc68a2a5a022ca485a5f

Best regards,
-- 
~Vinod



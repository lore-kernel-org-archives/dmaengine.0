Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE032D7F8;
	Wed,  4 Feb 2026 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770225153; cv=none; b=q3wI3PwPwAeqGKhf6wSkJ1HAiPWVwJ4mfkk2yo5ensjwUfRm9UYL8XWtnsZxUS7QQ/JGnwg2f0Xyd2x6f5j79rjePPe2SmwdoY1XVBbA7F80LB27kMWoRw7dif1vMYVDJr7+dV+66EyOs8YVbBiTLD7vss/TuzsmWZCq6KEWViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770225153; c=relaxed/simple;
	bh=A65JgNh/dhKrVxGsR+VXvsa+7tSfKtONLMjZKY6J3Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gx0KMwa1VFbFcVyrHeUsFWHgGthsqbgb8dcYuPHP4j1skpUCAYfsaHrHMQCvPX87fVxsK/TmOYqyML5p/VJFk5fSZPZQxhzU6xX8VSKyu9Em3nO0vqwJwuhzhdElK26XTev3FFyLCDsUeYDOjATSWdc+cjChibogc6z8v5uiwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKLlr+ll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKLlr+ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C09C4CEF7;
	Wed,  4 Feb 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770225153;
	bh=A65JgNh/dhKrVxGsR+VXvsa+7tSfKtONLMjZKY6J3Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NKLlr+lloUT/TPXN0vnmlAK49tcg4R+Z8i3/i+5y83yTefyAk3gs2QmbIG3/9dk96
	 AW60rNA4b18rQA4KaQnVw/iD2WMD3WCocCjLmHHhKQYGC2p7o0uIax5nBTm3zK93Nw
	 6/pEKbaB1qkXz9q1ASaN2M3Qta5ND8VCY2OrkUcm67eY35M/gJVErjls0u76JDfBNe
	 kOA8NUcOC6weiShM+js3sLICnX6evcobTJ/n4MhyNlVKS+PJl8a/7qSQtodUfI06zh
	 /TAmLfbfMJ/37LI5k+gSrblpzKFOpO5vjh6TBJsN0I2k6fYReocoPMHYZj3HG2l86u
	 +YCH7oaKdSP/w==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sibi.sankar@oss.qualcomm.com
In-Reply-To: <20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com>
References: <20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Update max interrupts
 lines to 16
Message-Id: <177022515070.153503.11031604367291773013.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 22:42:30 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 31 Dec 2025 19:01:14 +0530, Pankaj Patil wrote:
> Update interrupt maxItems to 16 from 13 per GPI instance to support
> Glymur, Qualcomm's latest gen SoC
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: qcom,gpi: Update max interrupts lines to 16
      commit: 876cbb60227fcfbcfcabf458eee5bc52cf5fbac0

Best regards,
-- 
~Vinod



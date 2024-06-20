//
//  DataSource.swift
//  AIProject
//
//  Created by Andrey Skrigalovsky on 6/13/24.
//

import Foundation

class DataSource {
    static func generateDocuments() -> [Document] {
        let documentData = [
            ("Company Policies", "This document contains the company policies regarding workplace behavior, dress code, and other important guidelines.", "Company policies on operations and behavior."),
            ("Project Plan", "The project plan outlines the steps, timelines, and resources needed to complete the project.", "Steps, resources, and timeline for project completion."),
            ("Employee Handbook", "The employee handbook provides information on company culture, benefits, and procedures.", "Information on company culture and benefits."),
            ("Annual Report", "The annual report contains financial statements, performance metrics, and other relevant data from the past year.", "Yearly financial and operational performance summary."),
            ("Financial Statement", "This document includes the balance sheet, income statement, and cash flow statement for the fiscal year.", "Balance sheets, income statements, and cash flow."),
            ("Marketing Strategy", "Strategies to promote the company's products and services to targeted audiences effectively.", "Marketing strategies for promoting products."),
            ("Sales Data", "Sales data analysis providing insights into sales trends, performance metrics, and forecasts.", "Sales data analysis and performance metrics."),
            ("Product Roadmap", "A roadmap outlining the future development and release plans for the company's products.", "Future development and product release plans."),
            ("Meeting Minutes", "Recorded minutes from the recent meeting, including key decisions, action items, and follow-ups.", "Minutes from recent meetings and key decisions."),
            ("Customer Feedback", "Feedback collected from customers regarding their experiences with the company's products and services.", "Customer feedback on products and services."),
            ("Training Manual", "A comprehensive training manual covering various aspects of employee training and development.", "Manual for employee training and development."),
            ("Technical Documentation", "Technical documentation providing detailed information on the company's products and services.", "Technical details on products and services."),
            ("HR Guidelines", "Guidelines from the HR department covering various policies and procedures.", "HR policies and procedures."),
            ("IT Security Policy", "Policies and procedures to ensure the security of IT systems and data.", "Policies for IT systems and data security."),
            ("Code of Conduct", "The code of conduct outlines the expected behavior and ethical standards for employees.", "Behavior and ethical standards for employees."),
            ("Compliance Report", "Report detailing the company's compliance with relevant laws and regulations.", "Company's compliance with laws and regulations."),
            ("Research Paper", "A research paper presenting findings from recent studies conducted by the company.", "Findings from recent research studies."),
            ("Budget Proposal", "Proposal outlining the budget for the upcoming fiscal year.", "Budget proposal for the next fiscal year."),
            ("Quarterly Review", "Review of the company's performance over the past quarter.", "Performance review for the past quarter."),
            ("Performance Metrics", "Detailed performance metrics and key performance indicators.", "Key performance indicators and metrics."),
            ("User Guide", "Guide providing instructions on how to use the company's products.", "Instructions for using company products."),
            ("Service Agreement", "Agreement outlining the terms and conditions of the company's services.", "Terms and conditions of services."),
            ("Contract Template", "Template for creating contracts with clients and vendors.", "Template for client and vendor contracts."),
            ("Business Proposal", "Proposal for a new business initiative or project.", "New business initiative proposal."),
            ("Product Specifications", "Specifications for the company's products including technical details.", "Technical specifications for products."),
            ("Market Analysis", "Analysis of the market trends and competitive landscape.", "Market trends and competitive analysis."),
            ("Competitive Analysis", "Detailed analysis of the company's competitors and their products.", "Analysis of competitors and their products."),
            ("Strategic Plan", "Long-term strategic plan outlining the company's goals and objectives.", "Long-term goals and objectives."),
            ("Operational Plan", "Operational plan detailing the company's day-to-day operations.", "Plan for day-to-day operations."),
            ("SWOT Analysis", "SWOT analysis identifying strengths, weaknesses, opportunities, and threats.", "Strengths, weaknesses, opportunities, and threats."),
            ("Case Study", "Case study presenting detailed analysis of a particular case or project.", "Detailed analysis of a specific case."),
            ("White Paper", "White paper providing in-depth information on a specific topic or issue.", "In-depth information on a specific topic."),
            ("Audit Report", "Report from an audit of the company's financial statements.", "Audit of financial statements."),
            ("Press Release", "Press release announcing a new product or event.", "Announcement of a new product or event."),
            ("Job Description", "Description of a job role and its responsibilities.", "Details of job roles and responsibilities."),
            ("Workplace Safety Guidelines", "Guidelines to ensure safety in the workplace.", "Safety guidelines for the workplace."),
            ("Employee Onboarding", "Onboarding process for new employees.", "Process for onboarding new employees."),
            ("Product Launch Plan", "Plan outlining the launch of a new product.", "Steps for launching a new product."),
            ("Social Media Policy", "Policy regarding the use of social media by employees.", "Guidelines for social media use."),
            ("Crisis Management Plan", "Plan for managing crises and emergencies.", "Steps for handling crises and emergencies."),
            ("Disaster Recovery Plan", "Plan for recovering from disasters affecting the company.", "Recovery steps for disasters."),
            ("Maintenance Schedule", "Schedule for regular maintenance of equipment and systems.", "Regular maintenance schedule."),
            ("IT Support Procedures", "Procedures for providing IT support to employees.", "Steps for IT support."),
            ("Privacy Policy", "Policy regarding the handling of personal data and privacy.", "Personal data and privacy policies."),
            ("Terms of Service", "Terms of service for using the company's products.", "Conditions for using products."),
            ("End User License Agreement", "Agreement for end users of the company's software products.", "Software product usage agreement."),
            ("Vendor Agreement", "Agreement with vendors for supplying goods and services.", "Terms with vendors."),
            ("Supplier Contract", "Contract with suppliers for providing goods.", "Terms with suppliers."),
            ("Project Charter", "Charter outlining the objectives and scope of a project.", "Objectives and scope of the project."),
            ("Scope Statement", "Statement defining the scope of a project.", "Project scope definition."),
            ("Risk Management Plan", "Plan for identifying and managing risks.", "Strategies for risk management."),
            ("Procurement Plan", "Plan for procuring goods and services.", "Goods and services procurement."),
            ("Resource Allocation Plan", "Plan for allocating resources to projects and tasks.", "Resource allocation strategies."),
            ("Team Communication Plan", "Plan for effective communication within teams.", "Strategies for team communication."),
            ("Stakeholder Analysis", "Analysis of stakeholders and their interests.", "Stakeholder interests analysis."),
            ("Change Management Plan", "Plan for managing changes in projects.", "Steps for change management."),
            ("Quality Management Plan", "Plan for ensuring quality in projects and processes.", "Strategies for quality management."),
            ("Knowledge Management Plan", "Plan for capturing and sharing knowledge within the company.", "Knowledge sharing strategies."),
            ("Learning and Development Plan", "Plan for employee learning and development.", "Strategies for learning and development."),
            ("Succession Plan", "Plan for succession in key roles.", "Strategies for succession planning."),
            ("Employee Retention Plan", "Plan for retaining employees.", "Strategies for employee retention."),
            ("Workforce Planning", "Plan for workforce needs and development.", "Strategies for workforce planning."),
            ("Recruitment Strategy", "Strategy for recruiting new employees.", "Employee recruitment strategies."),
            ("Retention Strategy", "Strategy for retaining current employees.", "Strategies for employee retention."),
            ("Employee Engagement Plan", "Plan for engaging employees in their work.", "Strategies for employee engagement."),
            ("Wellness Program", "Program for employee health and wellness.", "Health and wellness strategies."),
            ("Diversity and Inclusion Plan", "Plan for promoting diversity and inclusion.", "Diversity and inclusion strategies."),
            ("CSR Report", "Report on corporate social responsibility initiatives.", "CSR initiatives and results."),
            ("Sustainability Report", "Report on the company's sustainability efforts.", "Sustainability initiatives and results."),
            ("Energy Management Plan", "Plan for managing energy use.", "Strategies for energy management."),
            ("Waste Management Plan", "Plan for managing waste.", "Strategies for waste management."),
            ("Environmental Impact Assessment", "Assessment of the environmental impact of projects.", "Environmental impact analysis."),
            ("Community Engagement Plan", "Plan for engaging with the community.", "Strategies for community engagement."),
            ("Public Relations Strategy", "Strategy for managing public relations.", "Strategies for public relations."),
            ("Media Contact List", "List of media contacts for press releases.", "Contacts for media relations."),
            ("Event Plan", "Plan for organizing events.", "Steps for event organization."),
            ("Sponsorship Proposal", "Proposal for obtaining sponsorships.", "Strategies for sponsorship."),
            ("Fundraising Plan", "Plan for raising funds.", "Strategies for fundraising."),
            ("Donation Receipt", "Receipt template for donations.", "Template for donation receipts."),
            ("Grant Proposal", "Proposal for obtaining grants.", "Strategies for grant proposals."),
            ("Volunteer Agreement", "Agreement for volunteers.", "Terms for volunteer work."),
            ("Annual Giving Plan", "Plan for annual fundraising efforts.", "Strategies for annual fundraising."),
            ("Membership Program", "Program for managing memberships.", "Strategies for membership management."),
            ("Advocacy Plan", "Plan for advocacy efforts.", "Strategies for advocacy."),
            ("Lobbying Strategy", "Strategy for lobbying efforts.", "Strategies for lobbying."),
            ("Legislative Agenda", "Agenda for legislative efforts.", "Plans for legislative efforts."),
            ("Policy Brief", "Brief on policy issues.", "Summaries of policy issues."),
            ("Regulatory Compliance Plan", "Plan for ensuring regulatory compliance.", "Strategies for regulatory compliance."),
            ("Tax Strategy", "Strategy for managing taxes.", "Strategies for tax management."),
            ("Internal Audit Plan", "Plan for conducting internal audits.", "Steps for internal audits."),
            ("Fraud Prevention Plan", "Plan for preventing fraud.", "Strategies for fraud prevention."),
            ("Whistleblower Policy", "Policy for protecting whistleblowers.", "Guidelines for whistleblowers."),
            ("Ethics Policy", "Policy on ethical behavior.", "Guidelines for ethics."),
            ("Cultural Transformation Plan", "Plan for transforming organizational culture.", "Strategies for cultural transformation.")
        ]
        
        var documents = [Document]()
        let documentTypes: [DocumentType] = [.policy, .procedure, .instruction, .report, .other]
        
        for (index, data) in documentData.enumerated() {
            let (title, content, summary) = data
            let date = Date().addingTimeInterval(TimeInterval(-86400 * index))
            let type = documentTypes[index % documentTypes.count]
            
            let document = Document(title: title, content: content, date: date, type: type, summary: summary)
            documents.append(document)
        }
        
        return documents
    }
    
    static func searchDocuments(with keywords: String) -> [Document] {
        let allDocuments = generateDocuments()
        return allDocuments.filter { $0.title.localizedCaseInsensitiveContains(keywords) || $0.content.localizedCaseInsensitiveContains(keywords) }
    }
}
